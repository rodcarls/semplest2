package semplest.dmoz.tree;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Properties;

public class DmozTreeBuilder {
	
	private static String topNodeName = "top";
	
	private Long uniqueId = 0L;
	private DmozTreeNode topNode;
	
	private String categoryCidFile;
	//private String categoryDescriptionFile;
	private String categoryUrlsFile;		
	
	public static void main(String[] args){
		try{			
			DmozTreeBuilder tree = new DmozTreeBuilder();
			tree.buildDmozTree();
			TreeFuncs.printTree("c:\\dmoz\\BuiltTree.txt", tree.getTree());
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public DmozTreeBuilder() throws Exception{
		//Read property file for dmoz files paths
		Properties properties = new Properties();
		FileInputStream in = new FileInputStream("bin/system.properties");
		properties.load(in);
		in.close();
		
		this.categoryCidFile = properties.getProperty("dmoz.idFile");
		//this.categoryDescriptionFile = properties.getProperty("dmoz.descriptionFile");
		this.categoryUrlsFile = properties.getProperty("dmoz.urlDescFile");
	}
	
	public DmozTreeBuilder(String categoryCidFile, String categoryUrlsFile) throws Exception{
		this.categoryCidFile = categoryCidFile;
		//this.categoryDescriptionFile = categoryDescriptionFile;
		this.categoryUrlsFile = categoryUrlsFile;
	}
	
	public DmozTreeNode getTree(){
		return topNode;
	}
	
	public void buildDmozTree() throws Exception{
		System.out.println("Loading Dmoz data...");
		HashMap<String,DmozCategoryData> inputData = readInData();
		System.out.println("Building Dmoz tree...");
		buildTree(inputData);
		//assignTreeIDs(topNode);
		System.out.println("Done.");
	}
	
	private HashMap<String,DmozCategoryData> readInData() throws Exception{
		HashMap<String,DmozCategoryData> allData = new HashMap<String,DmozCategoryData>();		
		
		FileInputStream fstream;
		DataInputStream in;
		BufferedReader br;
		String strLine;
		
		// 1 -- load all cids
		fstream = new FileInputStream(categoryCidFile);
		in = new DataInputStream(fstream);
		br = new BufferedReader(new InputStreamReader(in));
		
		while ((strLine = br.readLine()) != null){
			String[] lineContents = strLine.split(" : ");
			String cat = lineContents[0].trim();
			String categoryId = lineContents[1].trim();
			DmozCategoryData catData = new DmozCategoryData();
			catData.setCategoryId(Long.valueOf(categoryId));
			allData.put(cat, catData);
		}
		in.close();

		// 2 --load category description, and all urls/url descs.
		fstream = new FileInputStream(categoryUrlsFile);
		in = new DataInputStream(fstream);
		br = new BufferedReader(new InputStreamReader(in));
		
		while ((strLine = br.readLine()) != null){
			String[] lineContents = strLine.split(" ");
			String cat = lineContents[0].trim();
			HashMap<String,String> urls = parseUrls(strLine);
			String catDesc = parseCategoryDesc(strLine);
			DmozCategoryData catData;
			if(!allData.containsKey(cat)){
				catData = new DmozCategoryData();
			}
			else{
				catData = allData.get(cat);
			}
			catData.setUrlData(urls);
			catData.setDescription(catDesc);
			allData.put(cat, catData);
		}
		in.close();
		
		/*
		// 3 --load all descriptions
		fstream = new FileInputStream(categoryDescriptionFile);
		in = new DataInputStream(fstream);
		br = new BufferedReader(new InputStreamReader(in));
		
		while ((strLine = br.readLine()) != null){
			String[] lineContents = strLine.split(" : ");
			String cat = lineContents[0].trim();
			String description = lineContents[1].trim();
			DmozCategoryData catData;
			if(!allData.containsKey(cat)){
				catData = new DmozCategoryData();
			}
			else{
				catData = allData.get(cat);
			}
			catData.setDescription(description);
			allData.put(cat, catData);
		}
		in.close();		
		*/
		
		return allData;
	}

	private DmozTreeNode buildTree(HashMap<String,DmozCategoryData> inputData) throws Exception{		
		
		//set up the top node
		topNode = new DmozTreeNode();
		Long topNodeId = getUniqueId();
		topNode.setNodeID(topNodeId);
		topNode.setParentID(-1L);
		topNode.setName(topNodeName);
		topNode.setParentNode(null);
		DmozCategoryData topCatData = inputData.containsKey("top")? inputData.get("top") : new DmozCategoryData();
		topNode.setCategoryData(topCatData);
		
		//process each category, and build the tree
		for(String cat : inputData.keySet()){
			String[] nodes = cat.split("/");			
			DmozCategoryData catData = inputData.containsKey(cat)? inputData.get(cat) : new DmozCategoryData();
			
			DmozTreeNode currentNode = topNode;
			
			//find or create nodes						
			for(int node = 1; node < nodes.length; node++){
				String currentLevelName = nodes[node];
				HashMap<String,DmozTreeNode> currentLevelNodes = currentNode.getChildrenNodes();
				String fullNodeName = currentNode.getName() + "/" + currentLevelName;
				if(!currentLevelNodes.containsKey(fullNodeName)){
					DmozTreeNode newNode = new DmozTreeNode();
					newNode.setNodeID(getUniqueId());
					newNode.setParentID(currentNode.getNodeID());
					newNode.setName(fullNodeName);
					newNode.setParentNode(currentNode);
					currentNode.addChildNode(newNode);
				}
				currentNode = currentLevelNodes.get(fullNodeName);
			}			
			currentNode.setCategoryData(catData);			
		}		
				
		return topNode;		
	}	
	
	private DmozTreeNode assignTreeIDs(DmozTreeNode topNode) throws Exception{
		//This method assign node PK by it's categoryID from DMOZ.
		//It's unused now.
		
		topNode.setNodeID(topNode.getCategoryData().getCategoryId());
		topNode.setParentID(-1L);
		
		assignParentChildrenIDs(topNode);
		
		return topNode;
	}
	
	private void assignParentChildrenIDs(DmozTreeNode currentNode) throws Exception{
		currentNode.setNodeID(currentNode.getCategoryData().getCategoryId());
		currentNode.setParentID(currentNode.getParentNode().getCategoryData().getCategoryId());
		for(DmozTreeNode childNode : currentNode.getChildrenNodes().values()){
			assignParentChildrenIDs(childNode);
		}
	}
	
	private Long getUniqueId(){
		uniqueId++;
		return uniqueId;
	}
	
	private HashMap<String,String> parseUrls(String lineContent) throws Exception{
		HashMap<String,String> urlAndDesc = new HashMap<String,String>();
		
		String urlcluster = lineContent.split(" : ")[1].split(" ::: ")[0].trim();
		String[] urlAndDescs = urlcluster.split(" :: ");
		for(String urlInfo : urlAndDescs){
			int index = urlInfo.trim().indexOf(" ");			
			String url = urlInfo.substring(0,index).trim();
			String desc = urlInfo.substring(index+1).trim();
			urlAndDesc.put(url, desc);
		}
		
		return urlAndDesc;
	}
	
	private String parseCategoryDesc(String lineContent) throws Exception{
		return lineContent.split(" ::: ")[1];
	}
	
}
