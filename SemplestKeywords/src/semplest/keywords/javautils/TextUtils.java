package semplest.keywords.javautils;

import org.htmlparser.Parser;
import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.beans.StringBean;
import org.htmlparser.beans.LinkBean;
import org.htmlparser.nodes.TextNode;
import org.htmlparser.nodes.TagNode;
import org.htmlparser.tags.LinkTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.NodeIterator;
import org.htmlparser.util.ParserException;
import org.htmlparser.filters.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Set;
import java.io.DataInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.FileInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.net.URL;
import java.net.URI;

import org.apache.log4j.Logger;

public class TextUtils {

  private static final Logger logger = Logger.getLogger( TextUtils.class );

  // HTML parsing utilities ---------------------
  //------------------
  // recursively collect nodes that match filter
  private static NodeList getNodes(Node n,  NodeFilter filter) 
    throws ParserException {
    NodeList list = new NodeList();
    n.collectInto( list, filter );
    NodeList c = n.getChildren();
    if( null != c)
      for( NodeIterator e = c.elements(); e.hasMoreNodes(); )
        e.nextNode().collectInto( list, filter );
    return list;
  }
  //Returns a fully formed url
  public static String formURL (String url){
    String newurl;
    if(url.contains("http://") || url.contains("https://")) newurl = url;
    else newurl = "http://"+url;
    return newurl;
  }
  // Return a list/Array of text strings from a web-page inside tag "filter"
  public static ArrayList<String> getLinks (String url, NodeFilter filter)
    throws ParserException {
    Parser parser = getParser( url );
    NodeList list = new NodeList();
    for( NodeIterator e = parser.elements(); e.hasMoreNodes(); )
      list.add( getNodes( e.nextNode(), filter) ); 

    ArrayList<String> strings = new ArrayList<String>();
    for( NodeIterator i = list.elements(); i.hasMoreNodes(); ){
      Node n = i.nextNode();
      if( n instanceof LinkTag ){            // text
        String link = ((LinkTag)n).extractLink() ;
        if( !strings.contains( link )) 
          strings.add( ((LinkTag)n).extractLink() );
      }
    }
    return strings;
  }

  //  Create a node filter
  public static NodeFilter makeFilter(){
    NodeFilter[] fa = new NodeFilter[3];
    fa[0] = new HasAttributeFilter("HREF");
    fa[1] = new TagNameFilter ("A");
    fa[2] = new HasParentFilter (new TagNameFilter( "H3" ));
    NodeFilter filter = new AndFilter ( fa ); 
    return filter;
  }


  //----------------------------
  // recursively process nodes and get text(top level is <html>)
  private static ArrayList<String> getText(Node n, String filter) 
    throws ParserException {
    ArrayList<String> strArray = new ArrayList<String>();

    String parentTag = "";
    TagNode parent = (TagNode) n.getParent();
    if( parent != null) parentTag = parent.getTagName();

    if( n instanceof TextNode ){            // text
      TextNode tn = (TextNode) n;
      //      System.out.println( parentTag + ":" + tn.getText().trim());
      if( filter.equals("") || filter.equalsIgnoreCase(parentTag) ){
        String text =  tn.getText().trim();
        text = text.replace( "&nbsp;", " ");   // remove non-breaking spaces 
        if( text.length() > 0 && !text.matches("\\s+") )
          strArray.add( text );
      }  
    }
    else {       // a tag or remark
      NodeList nl = n.getChildren();
      if( null != nl)
        for( NodeIterator ni = nl.elements(); ni.hasMoreNodes(); )
          strArray.addAll( getText( ni.nextNode(), filter ));
    }
    return strArray;
  }

  //--
  public static Boolean isValidUrl( String url ){
    final int CONNECT_TIMEOUT  = 1000;
    final int READ_TIMEOUT     = 1000;
    try {
      java.net.URLConnection conn = (new java.net.URL( url )).openConnection();
      conn.setConnectTimeout( CONNECT_TIMEOUT );
      conn.setReadTimeout( READ_TIMEOUT );
      java.io.InputStream is = conn.getInputStream();
    } catch (Exception e) {
      e.printStackTrace();
      logger.error( e.getMessage());
      return false;
    }
    return true;
  }

  // Return links from a url 
  // Make sure that the links are fully qualified
  public static URL[] HTMLLinks( String url ){
    // Get the links
    LinkBean sb = new LinkBean();
    sb.setURL( url );
    URL[] outlinks = sb.getLinks();

    // make links fully qualified
    URI baseURI = null;
    try {
      baseURI = new URI( url );
    } catch (Exception e) { e.printStackTrace(); 
      logger.error( e.getMessage());
      return new URL[0];
    }

    // ----
    ArrayList<URL> fqurls = new ArrayList<URL>();
    for(int i=0; i< outlinks.length; i++){
      URL fqurl = null;  
      try {
        fqurl = baseURI.resolve( outlinks[i].toURI() ).toURL();  
      } catch (Exception e) { 
        e.printStackTrace(); 
        logger.error( e.getMessage());
      }
      if( fqurl != null )
        fqurls.add( fqurl ); 
    }
    return fqurls.toArray( new URL[ fqurls.size()] );
  }

  // Return strings from a url 
  public static String HTMLText( String url ) throws Exception {
    if( ! isValidUrl( url )) throw new Exception("Invalid Url: " + url ); 
    String outs = "";

    StringBean sb = new StringBean();
    sb.setLinks( false );
    sb.setReplaceNonBreakingSpaces( true );
    sb.setCollapse( false );
    sb.setURL( url );
    try {
      outs = sb.getStrings();
    } catch (Exception e) {
      e.printStackTrace();
      logger.error( e.getMessage());
    }
    return outs;
  }

  // Return links from a url as a string of space separated urls
  public static String HTMLLinkString( String url ){
    URL[] links = HTMLLinks( url );
    String urls = "";
    for( URL link : links) 
      urls = urls + link.toString() + " "; 
    return urls.trim();
  }
  // Return links from a url as a string of space separated urls
  public static String HTMLLinkString( String url, String filter ){
    URL[] links = HTMLLinks( url );
    String urls = "";
    for( URL link : links){
      String slink = link.toString();
      if( slink.contains( filter ))
        urls = urls + slink + " "; 
    }
    return urls.trim();
  }

  // Get a list of all the urls upto <levels> deep within  
  public static String HTMLLinkString(String root, int level ){
    String urls = "";
    if( 0 == level) return urls;
    urls = HTMLLinkString( root );
    for( String u: urls.split("\\s+"))
      urls = urls + " " + HTMLLinkString( u, level-1);
    return urls.trim();
  } 
  // Get a list of all the urls upto <levels> deep
  // But only the urls that contain the string "filter" 
  public static String HTMLLinkString(String root, int level, String filter ){
    String urls = "";
    if( 0 == level) return urls;
    urls = HTMLLinkString( root, filter );
    for( String u: urls.split("\\s+"))
      if( u.contains( filter ))
        urls = urls + " " + HTMLLinkString( u, level-1, filter);
    return urls.trim();
  } 

  // Return a list/Array of text strings from a web-page inside tag "filter"
  public static ArrayList<String> HTMLStrings (String url, String filter)
    throws ParserException {
    ArrayList<String> strings = new ArrayList<String>();
    Parser parser = getParser( url );
    for( NodeIterator i = parser.elements(); i.hasMoreNodes();)
      strings.addAll( getText( i.nextNode(), filter.toUpperCase() ));
    return strings;
  }

  // Return text from a web-page inside tag "filter"
  public static String HTMLText (String url, String filter)
    throws ParserException {
    String text = "";
    ArrayList<String> sList;
    Parser parser = getParser( url );
    for( NodeIterator i = parser.elements(); i.hasMoreNodes();){
      sList = getText( i.nextNode(), filter.toUpperCase() );
      Iterator<String> it = sList.iterator();
      while( it.hasNext() )
        text = text + " " + it.next();
    }
    return text;
  } 

  // return words from a url, stemmed and validated 
  public static ArrayList<String> validHtmlStems( String url ){
    String htmlString = "";
    try { 
      htmlString = HTMLText( url );
    } catch ( Exception e ){
      e.printStackTrace();
      logger.error( e.getMessage());
    }
    ArrayList<String> words = getWords( htmlString );
    ArrayList<String> validWords = validStems( words );
    return validWords;
  }

  // Return stemmed words from a web page, in our dictionary 
  public static ArrayList<String> validStems( ArrayList<String> words ){
    Stemmer stemmer = new Stemmer();
    ArrayList<String> goodWords = new ArrayList<String>();
    for( String word : words ){
      String stem = stemmer.stem( word );
      if(  dictUtils.dict.containsKey( stem) )
        goodWords.add( stem );
    }
    return goodWords;
  }

  // return words from a url, stemmed and validated 
  public static ArrayList<String> validHtmlWords( String url ){
    String htmlString = "";
    try { 
      htmlString = HTMLText( url );
    } catch ( Exception e ){
      e.printStackTrace();
      logger.error( e.getMessage());
    }
    ArrayList<String> words = getWords( htmlString );
    ArrayList<String> validWords = validWords( words );
    return validWords;
  }


  public static ArrayList<String> validTextWords( String url ){
    String htmlString = "";
    try { 
      htmlString = FileText( url );
    } catch ( Exception e ){
      e.printStackTrace();
      logger.error( e.getMessage());
    }
    ArrayList<String> words = getWords( htmlString );
    ArrayList<String> validWords = validWords( words );
    return validWords;
  }
  public static String FileText(String filepath) throws IOException{
    FileInputStream fstream = new FileInputStream(filepath);
    // Get the object of DataInputStream
    DataInputStream in = new DataInputStream(fstream);
    BufferedReader br = new BufferedReader(new InputStreamReader(in));
    String data = "";
    String strLine;
    //Read File Line By Line
    while ((strLine = br.readLine()) != null)   {
      // Print the content on the console
      data = data+strLine;
    }
    //Close the input stream
    in.close();
    return data;
  }

  public static void getUniqueKeywords(String[] filepaths, String outputfile) throws IOException{
    ArrayList<String> kw = new ArrayList<String>();
    PrintStream out = new PrintStream(new FileOutputStream(outputfile));
    for(String path : filepaths){	
      FileInputStream fstream = new FileInputStream(path);
      DataInputStream in = new DataInputStream(fstream);
      // Get the object of DataInputStream
      BufferedReader br = new BufferedReader(new InputStreamReader(in));
      String strLine;


      //Read File Line By Line
      while ((strLine = br.readLine()) != null)   {
        String word = strLine.replaceAll("\\s+$", "").replaceAll("^\\s+", "");
        // Print the content on the console
        if(!kw.contains(word)){
          out.println(word);
          kw.add(word);
        }
      }		    
      //Close the input stream
      in.close();
    }

  }

  public static void changeKeywordMatchtoExact(String filepath) throws IOException{
    FileInputStream fstream = new FileInputStream(filepath);
    DataInputStream in = new DataInputStream(fstream);
    // Get the object of DataInputStream
    BufferedReader br = new BufferedReader(new InputStreamReader(in));
    String outputfile = filepath+"Exact";
    String strLine;
    PrintStream stdout = System.out;
    PrintStream out = new PrintStream(new FileOutputStream(outputfile));
    System.setOut(out);
    //Read File Line By Line
    while ((strLine = br.readLine()) != null)   {
      // Print the content on the console
      System.out.println("["+strLine.replaceAll("\\s+$", "").replaceAll("^\\s+", "")+"]");
    }
    System.setOut(stdout);

    //Close the input stream
    in.close();
  }

  // Return stemmed words from a web page, in our dictionary 
  public static ArrayList<String> validWords( ArrayList<String> words ){
    Stemmer stemmer = new Stemmer();
    ArrayList<String> goodWords = new ArrayList<String>();
    for( String word : words ){
      String stem = stemmer.stem( word );
      if(  dictUtils.dict.containsKey( stem ) )
        goodWords.add( dictUtils.dict.get(stem) );
    }
    return goodWords;
  }

  // get words from string  
  public static ArrayList<String> getWords( String text ){
    String lower    = text.toLowerCase(); 
    String noPunct  =  lower.replaceAll("\\W"," ");
    String noNum    =  noPunct.replaceAll("[0-9]"," ");
    ArrayList<String> words = new ArrayList<String>
      (Arrays.asList( noNum.split("\\s+")));
    return words;
  }

  // Create a parser with the right properties (needed for Google search)
  public static Parser getParser( String url ){
    try {
      java.net.URLConnection conn = (new java.net.URL( url )).openConnection();
      conn.setRequestProperty("User-Agent", "Mozilla");
      Parser p = new Parser( conn );
      return p;
    } catch (Exception e) { 
      e.printStackTrace (); 
      logger.error( e.getMessage());
    }
    return null;
  }

  public static Set<String> cleanWordSet( Set<String> mixedWordSet ){
    mixedWordSet.removeAll( dictUtils.CommonWordSet() );
    return mixedWordSet;
  }
  public static String timeElapsed(double msCount){
    return ((int)(msCount/60000)) + "min "+ ((msCount%60000/1000))+"sec";
  }

  // Synonyms from words.bighugelabs.com
  public static String getSynonyms( String word ) throws Exception {
    final String prefix = "http://words.bighugelabs.com/api/2/";
    final String apikey = "febc1a7d186b265748dac5331d603093/";
    final String url = prefix + apikey + word + "/";
    final String text = HTMLText( url );
    String res = "";
    for( String s : text.split("[\\n\\r\\f]+"))
      res = res + s.substring( s.lastIndexOf('|')+1 ) +  ",";

    return res;
  }

  //-----------------
  // Stem a word 
  public static String stem (String word){
    return (new Stemmer()).stem( word );
  }
  // Stem a string (of words) and return a string of *valid* english words
  public static String stemvString( String raws){
    String os = "";
    for( String w: raws.split("\\s+"))
      os = os + dictUtils.getStemWord( w ) + " ";
    return os;
  }

  //-------------------------------------------------------------
  public static void main (String[] args) throws Exception {
    System.out.println( HTMLText( args[0] ));
  }
}
