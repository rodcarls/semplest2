package semplest.keywords.lda;


import java.io.IOException;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;
import java.util.Set;
import java.util.TreeMap;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

import semplest.keywords.javautils.MultiWordCollect;
import semplest.keywords.javautils.TextUtils;
import semplest.keywords.javautils.ValueComparator;
import semplest.keywords.javautils.catUtils;
import semplest.keywords.javautils.dictUtils;
import semplest.services.client.interfaces.SemplestKeywordLDAServiceInterface;
import cc.mallet.types.InstanceList;

public class KWGenDmozLDAServer implements SemplestKeywordLDAServiceInterface{
	
	private static final Logger logger = Logger.getLogger(KWGenDmozLDAServer.class);
	//Search index for categories
	private static KWGenDmozLDAdata data;
	public KWGenDmozLDAServer() {

	}
	@Override
	public ArrayList<String> getCategories(String companyName, String searchTerm, String description, String[] adds, String url) throws Exception {
		if(searchTerm==null || searchTerm.length()==0) throw new Exception("No search term provided");
		if(url!=null) url = TextUtils.formURL(url);
		ArrayList<String> categories = this.getCategories(searchTerm);
		return categories;
	}
	public ArrayList<String> getCategories(String searchTerm) throws Exception {
		//Get category results from dmoz query
		
		String qs="";
		String[] res;
		String categories;
		ArrayList<String> optList = new ArrayList<String>();
		ArrayList<String> optInitial = new ArrayList<String>();
		int numresults = 100; // Number of results from the query
		qs=searchTerm;
		String qsStem = this.stemvString( qs, data.dict );
		if(qsStem !=null && qsStem.length()>0){
			System.out.println(qsStem);
			res = data.dl.search(qsStem,numresults);
			for(int i=0; i<res.length; i++){
				categories = res[i].replaceAll("\\s", "");
				if(catUtils.validcat(categories))
						optInitial.add(categories);
						//System.out.println(categories);
			}
			//Select repeated patterns
			optList= selectOptions(optInitial);
		}
		return optList;
	}
	
	@Override
	public ArrayList<ArrayList<String>> getKeywords(ArrayList<String> categories,String companyName, String searchTerm, String description, String[] adds, String url, Integer[] nGrams) throws Exception {
		
		if(categories==null || categories.size()==0){
			throw new Exception("No categories provided");
		}
		if(nGrams==null || nGrams.length==0){
			throw new Exception("No nGrams provided");
		} 
		
		//Add all data from inputs
		ArrayList<String> dataUrl= new ArrayList<String>();
		if(url!=null){
			url = TextUtils.formURL(url);
			dataUrl = TextUtils.validHtmlWords(url);
		}
		String data1 =  "";
		System.out.println("Words from url:"+ dataUrl.size());
		for( String s : dataUrl ) {
	    	data1 = data1+" "+s;
	    }
		if(adds!=null){
			for(int i=0; i< adds.length; i++){
				data1= data1+" "+ adds;
			}
		}
		data1 = data1+" "+companyName+" "+searchTerm+" "+description;
		String stemdata1 = new String();
		String[] datacount = data1.split("\\s");
		if(datacount.length<30) throw new Exception("Not enough data provided");
		stemdata1 = this.stemvString( data1, data.dict );
		ArrayList<ArrayList<String>> keywords = this.getKeywords(categories, searchTerm, stemdata1, 50, nGrams);
		return keywords;
	}
	
	
	public ArrayList<ArrayList<String>> getKeywords(ArrayList<String> categories, String searchTerm, String data1, int numkw, Integer[] nGrams) throws Exception {
		//Create a ArrayList of the categories that satisfy options selected by the user and ArrayList
		//with data form those categories
		ArrayList<String> optCateg = new ArrayList<String>();
		ArrayList<ArrayList<String>> keywords = new ArrayList<ArrayList<String>>();
		Set<String> labels = data.TrainingData.keySet();
		String cataux;
		int numNod;
		ArrayList<String> trainLines = new ArrayList<String>();
	    for (String label : labels){
	    	for (int n=0; n<categories.size();n++){
	    		cataux=categories.get(n);
	    		numNod = catUtils.nodes(cataux);
	    		if(catUtils.take(label, numNod).equals(catUtils.take(cataux,numNod))){
	    			if (!optCateg.contains(label)){
	    				//System.out.println(label);
	    				optCateg.add(label);
	    				//Gather training data
	    				trainLines.add(data.TrainingData.get(label));
	    			}
	    		}
	    	}
	    }
		//Train LDA for categories selected and return sorted keywords
		
		//Instanciate topic model
		MalletTopic lda = new MalletTopic();
		double alpha=0.01;
		double beta=0.01;
		int numiter=100;
		System.out.println("Number of categories" + trainLines.size());
		lda.CreateInstances(trainLines);
		lda.setNumTopics(5);
		lda.LDAcreateModel(alpha, beta, numiter);
		InstanceList inferInst;
		double[][] categInd;
	    inferInst=lda.CreateInferInstfromData("0", "Test Data", data1);
	    HashMap<String, Double> wordMap = new HashMap<String, Double>();
	    
	    //Infer word probability based on input data
	    wordMap = lda.inferWordprob(inferInst, 0,true);
	    String qsStem = this.stemvString( searchTerm, data.dict ); 
	    if(searchTerm!=null){
		    String[] terms = qsStem.split("\\s");
		    for(int n=0; n<terms.length; n++){
		    	wordMap.put(terms[n], new Double(1.0));
		    }
	    }
	    
	    ValueComparator bvc =  new ValueComparator(wordMap);
		TreeMap<String,Double> wordM = new TreeMap(bvc);
		wordM.putAll(wordMap);
	    Set<String> keyS = wordM.keySet();
	    System.out.println("wordMap Size: "+ wordM.size());
	    int i=0;
	    for(int n=0;n<nGrams.length;n++){
	    	ArrayList<String> kwds=new ArrayList<String>();
	    	if(nGrams[n] == 1){
			    for(String keys2 : keyS){
			    	if(i>=numkw)break;
			    	//System.out.print(" "+keys2+",");
			    	kwds.add(keys2);
			    	i++;
			    }
		    }else
		    	kwds = getKwMulti(optCateg,numkw,wordMap,nGrams[n]);
	    	keywords.add(kwds);
	    }
	    
		return keywords;
	}

	public ArrayList<String> getKwMulti(ArrayList<String> optCateg, int numkw, HashMap<String, Double> wordMap, int nGrams) throws Exception{
		//Generates keywords with nGrams words

		MultiWordCollect[] nGramsA=data.biGrams;
		ArrayList<String> keywords = new ArrayList<String>();
		//Select bigrams or trigrams based on nGrams value
		switch (nGrams){
		case 2: nGramsA=data.biGrams; break;
		case 3: nGramsA=data.triGrams; break;
		default: throw new Exception("nGrams value not valid");
		}
		

		  //**************************************************************************************
			// Now that we have generated a selection of categories that we want to use to generate our alphabet,
			// we need to generate that alphabet and infer the word probabilities for each of the words in the alphabet
			HashMap<String, Double> multWMap = new HashMap<String, Double>();
			ValueComparator bvc =  new ValueComparator(multWMap);
			TreeMap<String,Double> sorted_map = new TreeMap<String,Double>(bvc);
			int i=0;
			Set<String> keySet;
			java.util.Iterator<String> iterator;
			ArrayList<String> mWords= new ArrayList<String>();
			String[] subWrds;
			String kwrd;
			double wProb;
			boolean in=true;
			// Generating Multiword alphabet
			// Extract multiword for each category in the list and multiply probabilities of each subword
			for(String optKey: optCateg){
				int mIndex= data.getnGramSubCatInd(optKey);
				mWords = nGramsA[mIndex].getwordsInCateg(optKey);
				if (mWords != null){
					for(String mWrd:mWords){
						subWrds=mWrd.split("\\+");
						wProb=1.0;
						kwrd="";
						for(int n=0;n<subWrds.length;n++){
							if(kwrd.contains(subWrds[n])){
								in=true;
								break;
							}
							in=false;
							if(wordMap.containsKey(subWrds[n])){
								wProb=wProb*wordMap.get(subWrds[n]);
							}else {
								//System.out.println(subWrds[n]+" is not in wordmap");
								wProb=wProb*0.0;
							}
							kwrd=kwrd+subWrds[n]+" ";
						}
						
						if(!in && wProb>0){
							multWMap.put(kwrd, wProb);
						}
						
					}
				}
			}
			//Once the alphabet and probabilities have been generated, sort by probability.
			sorted_map.putAll(multWMap);
			
			//Generating Keywords
		    keySet=sorted_map.keySet();
		    iterator=keySet.iterator();
		    
		    String keyword;
		    i=0;
		    iterator=keySet.iterator();
		    double baseProb = 1.0;
		    while(i<numkw){
		    		if(iterator.hasNext())keyword =iterator.next();
		    		else break;
		    		if(baseProb>=1.0 && multWMap.get(keyword)<1.0)
		    			baseProb = multWMap.get(keyword);
		    		double diff = baseProb- multWMap.get(keyword);
		    		//if(nGrams==2 && diff>0.01718787) break;
		    		//if(nGrams==3 && diff>0.001718787) break;
		    		//System.out.println(diff+"\t"+keyword);
		    		keywords.add(keyword);
				    i++;
		    }
		    return keywords;
		
	}
	private static ArrayList<String> selectOptions(ArrayList<String> optKeys) throws IOException{
		//Selects patterns from top categories list to generate options for the user based on pre-defined crieteria


		int numNEval=20;
	  	HashMap<String,Double> optList = new HashMap<String,Double>();
	  	ValueComparator bvcAux = new ValueComparator(optList);
	  	TreeMap<String,Double> sorted_opt = new TreeMap<String,Double>(bvcAux);
		
		 
	    int numNodes;
	    //Identify repeated patterns in top categories
	    String  newoption;
	    String[] pair= new String[2];
	    for(int n=0; n<optKeys.size(); n++){
	    	for (int m=0; m<n;m++){
	    		pair[0]=optKeys.get(n); pair[1]=optKeys.get(m);
	    		newoption = catUtils.longestAncestor(pair);
	    		if(optList.containsKey(newoption)){
	    			optList.put(newoption, ((Double)optList.get(newoption))+1.0);
	    		}else {
	    			optList.put(newoption, new Double(1));
	    		}
	    	}
	    }
	    
	    sorted_opt.putAll(optList);
	    
	    //Filter out just relevant patterns
	    HashMap<String,Double> optList2= new HashMap<String,Double>();
		ValueComparator bvcAux2 = new ValueComparator(optList2);
	  	TreeMap<String,Double> sorted_opt2 = new TreeMap<String,Double>(bvcAux2);
	    Double numrepeat;
	    Set<String> optKeys2 = sorted_opt.keySet();
	    for(String optKey:optKeys2){
	    	numNodes = catUtils.nodes(optKey);
	    	numrepeat = optList.get(optKey);
	    	if(numNodes>=4  && numrepeat >3){
	    		if(catUtils.last(optKey).length()>1){
		    		if(!optList2.containsKey(catUtils.take(optKey, numNEval))){
		    			optList2.put(catUtils.take(optKey, numNEval),new Double(numNodes));
		    		}
	    		}
	    	}
	    }

	    sorted_opt2.putAll(optList2);
	    // Present sorted pattern form most relevant to less relevant
	    Set<String> sorted_optKeys2 = sorted_opt2.keySet();
	    ArrayList<String> arrayOpt=new ArrayList<String>();
	    //Add top 3
	    int numtop;
	    if(sorted_optKeys2.size()<5)
	    	numtop=5;
	    else
	    	numtop=4;
	    int numresults=0;
	    for(int i=0; i<optKeys.size(); i++){
	    	if(numresults>=numtop) break;
	    	//String key = catUtils.init(optKeys.get(i));
	    	String key = optKeys.get(i);
	    	if(!arrayOpt.contains(key)){
	    		arrayOpt.add(key);
	    		numresults++;
	    	}
	    }
	    //Add rest of the patterns
	    for(String key: sorted_optKeys2){
	    	if(!arrayOpt.contains(key))
	    		arrayOpt.add(key);
	    }
	  
	    return arrayOpt;
	    
	}
	
	@Override
	public void initializeService(String str) throws Exception {
		logger.info("Initialize Service.  Ceating KWGenDmozLDAdata object");
		data = new KWGenDmozLDAdata();
		Thread thread = new Thread(data);
		thread.start();
	}
	
	public String stemvString( String raws, dictUtils dict){
		//Returns the stemmed version of a word
	    String os = "";
	    for( String w: raws.split("\\s+"))
	      os = os + dict.getStemWord( w ) + " ";
	    return os;
	  }
	
	public static void main(String[] args) throws Exception {
		KWGenDmozLDAServer kwGen =  new KWGenDmozLDAServer();
		kwGen.initializeService(null);
		String[] searchTerm = new String[1];
		String userInfo1="";
		BasicConfigurator.configure();
		while (!userInfo1.equals("exit")){
			try{
			System.out.println("\nPlease, introduce search terms:");
			Scanner scanFile = new Scanner(System.in);
			searchTerm[0] = scanFile.nextLine();
			String[] adds= new String[1];
			adds[0] = "";
			String description="";
			
			System.out.println("Search Terms: "+searchTerm[0]);
			ArrayList<String> categOpt = kwGen.getCategories(null, searchTerm[0], null, null, null);
			System.out.println("\nCategory options:");
			int m=0;
			for (String opt:categOpt){
				System.out.println(m+"- "+opt);
				m++;
			}
			System.out.println("Please, type indexes of categories to select separated by ',':");
			Scanner scan = new Scanner(System.in);
		    String mySentence = scan.nextLine(); 
		    String[] indexes = mySentence.split(",");
		    
		    ArrayList<String> categories = new ArrayList<String>();
		    for (int v=0; v<indexes.length;v++){
		    	System.out.println(categOpt.get(Integer.parseInt(indexes[v])));
		    	categories.add(categOpt.get(Integer.parseInt(indexes[v])));
		    }
			categories.add(categOpt.get(0));
			
			System.out.println("Please, introduce path to file containing landing page (type \"exit\" to close) :");
			scanFile = new Scanner(System.in);
			userInfo1 = scanFile.nextLine(); 
			ArrayList<String> words1;
			String url=null;
			String uInf="";
			if(userInfo1.contains(".clean")){
				words1 = TextUtils.validTextWords (userInfo1);
				for(String word: words1){
					uInf=uInf+" "+word;
				}
			}else	
				url = userInfo1;
			
			System.out.println("Please, introduce path to file containing user info (type \"exit\" to close) :");
			scanFile = new Scanner(System.in);
			userInfo1 = scanFile.nextLine(); 
			if(userInfo1.contains(".info")){
				words1 = TextUtils.validTextWords (userInfo1);
				for(String word: words1){
					description=description+" "+word;
				}
			}
			
			System.out.println("Please, introduce path to file containing adds (type \"exit\" to close) :");
			scanFile = new Scanner(System.in);
			userInfo1 = scanFile.nextLine(); 
			if(userInfo1.contains(".add")){
				words1 = TextUtils.validTextWords (userInfo1);
				for(String word: words1){
					adds[0]=adds[0]+" "+word;
				}
			}
			
			
			
			Integer[] nGrams = {1,2,3};
			ArrayList<ArrayList<String>> kw = kwGen.getKeywords(categories,null, searchTerm[0], uInf, adds, url,nGrams);
			
			for(int n=0; n<nGrams.length; n++){
				System.out.println("\n"+ (n+1)+" word keywords:");
				for(String k: kw.get(n)){
					k=k.replaceAll("wed", "wedding");
					System.out.print(k+", ");
				}
			}
			PrintStream stdout = System.out;
			//System.setOut(new PrintStream(new FileOutputStream("/semplest/data/biddingTest/Test1/keywords.txt")));
			for(int n=1; n<nGrams.length; n++){
				for(String k: kw.get(n)){
					k=k.replaceAll("wed", "wedding");
					System.out.println(k);
				}
			}
			System.setOut(stdout);
			}catch(Exception e){
				System.out.println(e);
			}
		}
	}



}
