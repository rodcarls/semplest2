package semplest.services.client.interfaces;

import java.util.ArrayList;
import java.util.HashMap;

import semplest.server.protocol.adengine.KeywordDataObject;

public interface SemplestBiddingInterface extends ServiceInitialize {
	
	void setBidsInitial(Integer promotionID, String searchEngine) throws Exception;

	
	HashMap<String,Double> getBid(String accountID, Long campaignID, Long adGroupID, ArrayList<String> keywords) throws Exception ;

	void getBidsInitial(String accountID, Long campaignID, Long adGroupID, String searchEngine) throws Exception;
	void getBidsInitialNaive(String accountID, Long campaignID, Long adGroupID, String searchEngine) throws Exception;

	void getBidsUpdate(String accountID, Long campaignID, Long adGroupID, String searchEngine) throws Exception;
	void getBidsUpdateNaive(String accountID, Long campaignID, Long adGroupID, String searchEngine) throws Exception;
	
	HashMap<String,Double> GetMonthlyBudgetPerSE(ArrayList<String> searchEngine, Double TotalMonthlyBudget) throws Exception;	

}
