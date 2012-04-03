package semplest.services.client.api;

import java.util.ArrayList;

import javax.ws.rs.core.MultivaluedMap;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;

import semplest.server.protocol.ProtocolJSON;
import semplest.services.client.interfaces.SemplestKeywordLDAServiceInterface;

public class KeywordLDAServiceClient extends ServiceRun implements SemplestKeywordLDAServiceInterface 
{
	private static String SERVICEOFFERED = "semplest.service.google.adwords.GoogleAdwordsService";
	private static String BASEURLTEST = "http://VMJAVA1:9898/semplest";  //VMJAVA1
	private static String timeoutMS = "10000";
	private static ProtocolJSON protocolJson = new ProtocolJSON();
	private static Gson gson = new Gson();
	private static final Logger logger = Logger.getLogger(KeywordLDAServiceClient.class);
	
	private String baseurl;
	
	public KeywordLDAServiceClient(String baseurl)
	{
		if (baseurl == null)
		{
			this.baseurl = BASEURLTEST;
		}
		else
		{
			this.baseurl = baseurl;
		}
	}
	
	@Override
	public ArrayList<String> getCategories(String[] searchTerm) throws Exception
	{
		// TODO Auto-generated method stub
		return null;
	}

}
