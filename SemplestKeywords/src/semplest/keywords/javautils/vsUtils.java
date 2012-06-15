package semplest.keywords.javautils;

import java.lang.Math;
import java.util.Set;
import java.util.HashSet;
import java.util.TreeSet;
import java.util.HashMap;
import java.util.Map;
import java.util.Comparator;

import semplest.keywords.properties.ProjectProperties;

/*
 * Vector Space (vs) tool-box
 * Treats a word-count as a vector in the word-space
 * The basic vector here is a HashMap<String,Integer>
 * 
 * Note; To use counts and avoid fractions, the UNIT vector
 * has length = 1000 rather than 1.
 * 
 */
public class vsUtils {

  private static final int UNIT = 1000;    // The unit-vector length

  // - static interface -----------------------------------------------------------
  // normalize vector to UNIT length (L2 norm) 
  public static Double cNorm( HashMap<String,Integer> wc){
    return ( UNIT * 1.0 / Math.max( Math.sqrt( sSquares( wc ) ), 1.0 ));}
  public static Integer cLen( HashMap<String,Integer> wc){
    return (int) Math.round( Math.sqrt( sSquares( wc ) ) ); }
  public static HashMap<String,Integer> cNormalize( HashMap<String,Integer>  wc){
    HashMap<String,Integer> omap = new HashMap<String,Integer>();
    Double w = cNorm( wc );
    for( Map.Entry<String,Integer> e: wc.entrySet() )
      omap.put( e.getKey(), (int) Math.round( e.getValue() * w ));
    return omap;
  }
  // add a bunch of vectors  
  public static HashMap<String,Integer> cAdd( HashMap<String, 
      HashMap<String,Integer>>  wcs){
    HashMap<String,Integer> omap = new HashMap<String,Integer>();
    for( Map.Entry<String,HashMap<String,Integer>> wc: wcs.entrySet() ) 
      for( Map.Entry<String,Integer> e: wc.getValue().entrySet() )
        omap.put( e.getKey(), (omap.containsKey(e.getKey()) ? 
            omap.get(e.getKey()) : 0) + e.getValue());  
    return omap;
  }
  // cosine distance between two vectors (word-counts)
  public static Double cDist( HashMap<String,Integer> a, HashMap<String,Integer> b){
    HashMap<String,Integer> na = cNormalize( a );
    HashMap<String,Integer> nb = cNormalize( b );
    Double dotp = 0.0;
    for( Map.Entry<String,Integer> e: na.entrySet() )
      if( nb.containsKey( e.getKey() ) )
        dotp += e.getValue() * nb.get( e.getKey() );
    return Math.acos( dotp / (UNIT * UNIT * 1.0) );
  }
  // Combine a bunch of vectors (wcs), based on their distance to a reference wc
  public static HashMap<String,Integer> cCombine( 
      HashMap<String, HashMap<String,Integer>> wcs, HashMap<String,Integer> rv ){
    HashMap<String,Double> omap = new HashMap<String,Double>();
    for( Map.Entry<String,HashMap<String,Integer>> wc: wcs.entrySet() ) { 
      Double w = Math.PI/2.0 - cDist( wc.getValue(),rv );  // the weight
      HashMap<String,Integer> nwc = cNormalize( wc.getValue() );
      for( Map.Entry<String,Integer> e: nwc.entrySet() )
        if( omap.containsKey( e.getKey() ) )
          omap.put( e.getKey(), omap.get( e.getKey() ) + e.getValue() * w );
        else
          omap.put( e.getKey(), e.getValue() * w );
    }
    // convert to int, normalize, return
    HashMap<String,Integer> rmap = new HashMap<String,Integer>();
    for( Map.Entry<String,Double> e: omap.entrySet() )
      rmap.put( e.getKey(), (int) Math.round( e.getValue()) );

    return cNormalize( rmap );
  }
  // returns map sorted by word-count in descending order
  public static TreeSet sortMap( HashMap<String,Integer> wc ){
    TreeSet<Map.Entry<String,Integer>> tm = new TreeSet<Map.Entry<String,Integer>>(
        new Comparator<Map.Entry<String,Integer>>(){
          @Override public int compare( Map.Entry<String,Integer> a, 
            Map.Entry<String,Integer> b){ 
              return b.getValue().compareTo( a.getValue());}
          });
    
    tm.addAll( wc.entrySet() );
    return tm;
  }
  public static String[] topWords( HashMap<String,Integer> wc, Integer n){
    Set<Map.Entry<String,Integer>> rv = take( sortMap( wc ), n );
    Set<String> s = new HashSet<String>();
    for( Map.Entry<String,Integer> e: rv )
      s.add( e.getKey() );
    return s.toArray( new String[]{} );
  }
  // ----------------------------------
  public static <K> Set<K> take( Set<K> s, Integer n){
    Set<K> res = new HashSet<K>(); 
    int counter = 0;
    for( K e: s ){
      if ( counter >= n ) break;
      res.add( e );
      counter++;
    }
    return res;
  }
  public static <K,V> Map<K,V> take( Map<K,V> m, Integer n){
    Map<K,V> res = new HashMap<K,V>(); 
    int counter = 0;
    for( Map.Entry<K,V> e: m.entrySet() ){
      if ( counter >= n ) break;
      res.put( e.getKey(), e.getValue());
      counter++;
    }
    return res;
  }
  // - private helpers -----------------------------------------------
  private static Integer sSquares( HashMap<String,Integer> wc ){
    Integer res = 0;
    for( Map.Entry<String,Integer> e: wc.entrySet() )
      res += e.getValue() * e.getValue();
    return res;
  }

  // - pretty printers ------------
  private static void pWc( String label, HashMap<String,Integer> wc, int n ){
    TreeSet<Map.Entry<String,Integer>> rv = sortMap( wc );
    System.out.print( label + " :: \t" );
    int count = 0;
    for( Map.Entry<String,Integer> e: rv ){
      if ( count > n ) break;
      System.out.printf("%s:%d, ", e.getKey(), e.getValue());
      count++;
    }
    System.out.println();
  }

  // wc creators
  private static HashMap<String,Integer> cWc(String[] words ){
    HashMap<String,Integer> rv = new HashMap<String,Integer>();
    for( String w: words)
      rv.put( w, (rv.get(w) == null ? 0 : rv.get(w)) + 1 );
    return rv;
  }
  private static HashMap<String,Integer> cWc(String words ){ 
    return cWc( words.split("\\s+") );
  }
  //- tests ---------------------------------------------------------------
  // ------------
  private static void test(){
    HashMap<String,Integer> rv = cWc("a b c d");
    HashMap<String,HashMap<String,Integer>> cs = 
      new HashMap<String,HashMap<String,Integer>>();
    cs.put( "a0.5", cWc("a b c"));
    cs.put( "b0.0", cWc("a b c d"));
    cs.put( "c1.0", cWc("c d e"));
    cs.put( "d1.5", cWc("e f g"));

    HashMap<String,Integer> cc = cCombine( cs, rv );
    System.out.println( cc );
  }

  private static void Test(String ngramFile, String ancestor, String ref){
    // read in categories from file and pick out those with ancestor
    HashMap<String,HashMap<String,Integer>> wcs = catUtils.family( 
        ioUtils.readWcs( ngramFile ), ancestor ); 
    
    // create a reference word-count
    HashMap<String,Integer> rv = cWc( ref );

    // combine them (remember how long it took)
    long start = System.currentTimeMillis();
    HashMap<String,Integer> cc = cCombine( wcs, rv );
    long end = System.currentTimeMillis();

    // print the top 50 words (by count) and the time it took to combine 
    System.out.println( ioUtils.mkString( topWords( cc, 50 ), ", ") );
    System.out.println( "Combining " +wcs.size()+ " cats took " +(end-start)+ "ms");
  }

  //-------------------------------------------------------------
  public static void main (String[] args){
    // String file = "/semplest/data/dmoz/multiwords/news.txt.2";
    String file = "/semplest/data/dmoz/news/hTest.2.3g";
    String head = "top/news/media/journalism/journalists";
    String rwords = "new+york+times real+estate+autos " + 
        "page+last+updated business+finance+people politics+travel+sports " + 
        "wall+street+journal read+full+story print+television+radio" + 
        "front+news+articles new+york+post christian+science+monitor" ;
    Test( file, head, rwords );
  }
}

