package semplest.keywords.javautils;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Element;

import java.util.HashMap;
import java.util.Map;
import java.net.URL;
import java.util.Comparator;

// Uses Google's autocomplete service to get keyword suggestions and volume

public class XmlUtils {

  // - The interface ----------
  // Uses Dom parser 
  public static HashMap<String,Integer> autoCompletes (String query) {
    HashMap<String,Integer> res = new HashMap<String,Integer>();
    try {
      DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
      DocumentBuilder b = f.newDocumentBuilder();
      Document d = b.parse( acUrl( query ));
      NodeList l = d.getElementsByTagName("CompleteSuggestion");
      for(int i = 0; i < l.getLength(); i++ ){
        Element s = (Element) l.item( i ).getFirstChild();
        Element n = (Element) l.item( i ).getLastChild();
        res.put( s.getAttribute( "data" ), 
            Integer.decode( n.getAttribute( "int" )));
      }
    } catch (Exception e) { e.printStackTrace(); }
    return res;
  }

  // -----
  // Number of search results for term
  public static int getPopularity( String query ){
    Map<String,Integer> r = autoCompletes( query );
    if( r.containsKey( query)) return r.get( query );
    String k = java.util.Collections.min( r.keySet(),
      new Comparator<String>(){ 
        public int compare( String a, String b ){
          return a.length() - b.length();}
      }
    );
    return r.get( k );
  }

  // - Helpers -------------------
  // The url
  private static String acUrl(String query){
    String burl = "http://google.com/complete/search?output=toolbar&q=";
    return  burl + ioUtils.mkString( query.split("\\s+"),"+");
  }

  //-------------------------------------------------------------
  public static void main (String[] args){
    if( args.length  < 1 ) return;
    // HashMap<String,Integer> res = getSuggestions( args[0] );
    HashMap<String,Integer> res = autoCompletes( args[0] );
    for( Map.Entry<String,Integer> e : res.entrySet())
      System.out.println( e.getKey() + " : " + e.getValue() );

    System.out.println("Num Results for " + args[0] + " : " + 
        getPopularity( args[0] ));
  }
}