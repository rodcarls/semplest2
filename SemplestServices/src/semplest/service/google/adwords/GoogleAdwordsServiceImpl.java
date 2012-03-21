package semplest.service.google.adwords;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import semplest.other.DateTimeCeiling;
import semplest.other.DateTimeFloored;
import semplest.services.client.interfaces.GoogleAdwordsServiceInterface;

import com.google.api.adwords.lib.AdWordsService;
import com.google.api.adwords.lib.AdWordsUser;
import com.google.api.adwords.lib.utils.MapUtils;
import com.google.api.adwords.v201109.cm.Ad;
import com.google.api.adwords.v201109.cm.AdGroup;
import com.google.api.adwords.v201109.cm.AdGroupAd;
import com.google.api.adwords.v201109.cm.AdGroupAdOperation;
import com.google.api.adwords.v201109.cm.AdGroupAdReturnValue;
import com.google.api.adwords.v201109.cm.AdGroupAdServiceInterface;
import com.google.api.adwords.v201109.cm.AdGroupCriterion;
import com.google.api.adwords.v201109.cm.AdGroupOperation;
import com.google.api.adwords.v201109.cm.AdGroupPage;
import com.google.api.adwords.v201109.cm.AdGroupReturnValue;
import com.google.api.adwords.v201109.cm.AdGroupServiceInterface;
import com.google.api.adwords.v201109.cm.AdGroupStatus;
import com.google.api.adwords.v201109.cm.BiddableAdGroupCriterion;
import com.google.api.adwords.v201109.cm.Budget;
import com.google.api.adwords.v201109.cm.BudgetBudgetDeliveryMethod;
import com.google.api.adwords.v201109.cm.BudgetBudgetPeriod;
import com.google.api.adwords.v201109.cm.Campaign;
import com.google.api.adwords.v201109.cm.CampaignOperation;
import com.google.api.adwords.v201109.cm.CampaignPage;
import com.google.api.adwords.v201109.cm.CampaignReturnValue;
import com.google.api.adwords.v201109.cm.CampaignServiceInterface;
import com.google.api.adwords.v201109.cm.CampaignStatus;
import com.google.api.adwords.v201109.cm.Keyword;
import com.google.api.adwords.v201109.cm.KeywordMatchType;
import com.google.api.adwords.v201109.cm.ManualCPC;
import com.google.api.adwords.v201109.cm.Money;
import com.google.api.adwords.v201109.cm.Operator;
import com.google.api.adwords.v201109.cm.OrderBy;
import com.google.api.adwords.v201109.cm.Paging;
import com.google.api.adwords.v201109.cm.Predicate;
import com.google.api.adwords.v201109.cm.PredicateOperator;
import com.google.api.adwords.v201109.cm.Selector;
import com.google.api.adwords.v201109.cm.SortOrder;
import com.google.api.adwords.v201109.cm.TextAd;
import com.google.api.adwords.v201109.mcm.Account;
import com.google.api.adwords.v201109.mcm.CreateAccountOperation;
import com.google.api.adwords.v201109.mcm.CreateAccountServiceInterface;
import com.google.api.adwords.v201109.o.Attribute;
import com.google.api.adwords.v201109.o.AttributeType;
import com.google.api.adwords.v201109.o.CriterionAttribute;
import com.google.api.adwords.v201109.o.IdeaType;
import com.google.api.adwords.v201109.o.KeywordMatchTypeSearchParameter;
import com.google.api.adwords.v201109.o.LongAttribute;
import com.google.api.adwords.v201109.o.RelatedToKeywordSearchParameter;
import com.google.api.adwords.v201109.o.RequestType;
import com.google.api.adwords.v201109.o.SearchParameter;
import com.google.api.adwords.v201109.o.TargetingIdea;
import com.google.api.adwords.v201109.o.TargetingIdeaPage;
import com.google.api.adwords.v201109.o.TargetingIdeaSelector;
import com.google.api.adwords.v201109.o.TargetingIdeaServiceInterface;
import com.google.gson.Gson;

public class GoogleAdwordsServiceImpl implements GoogleAdwordsServiceInterface
{
	private static final Logger logger = Logger.getLogger(GoogleAdwordsServiceImpl.class);
	private static Gson gson = new Gson();
	// THis needs to be read from the Database
	private static String email = "adwords@semplest.com";
	private static String password = "ic0system";
	private static String userAgent = "Icosystem";
	private static String developerToken = "2H8l6aUm6K_Q44vDvxs3Og";
	private static boolean useSandbox = false;

	public String CreateOneAccountService(String json) throws Exception
	{
		logger.debug("call CreateOneAccountService(String json)" + json);
		HashMap<String, String> data = gson.fromJson(json, HashMap.class); // protocolJson.getHashMapFromJson(json);
		Account account = CreateOneAccountService(data.get("currencyCode"), data.get("dateTimeZone"), data.get("companyName"),
				data.get("descriptiveName"));
		// convert result to Json String
		return gson.toJson(account);
	}

	@Override
	public Account CreateOneAccountService(String currencyCode, String dateTimeZone, String companyName, String descriptiveName) throws Exception
	{
		AdWordsUser user = new AdWordsUser(email, password, null, userAgent, developerToken, useSandbox);
		// Get the AccountService.
		CreateAccountServiceInterface createAccountService = user.getService(AdWordsService.V201109.CREATE_ACCOUNT_SERVICE);
		// Create account.
		Account account = new Account();
		if (currencyCode == null)
		{
			currencyCode = "USD";
		}
		if (dateTimeZone == null)
		{
			dateTimeZone = "America/New_York";
		}
		account.setCurrencyCode(currencyCode);
		account.setDateTimeZone(dateTimeZone);
		account.setCompanyName(companyName);
		// Create operations.
		CreateAccountOperation operation = new CreateAccountOperation();
		operation.setOperand(account);
		operation.setDescriptiveName(descriptiveName);
		operation.setOperator(Operator.ADD);

		CreateAccountOperation[] operations = new CreateAccountOperation[]
		{ operation };
		// Add account.
		Account[] result = createAccountService.mutate(operations);
		// Display accounts.
		return result[0];

	}

	public String CreateOneCampaignForAccount(String json) throws Exception
	{
		logger.debug("call CreateOneAccountService(String json)" + json);
		HashMap<String, String> data = gson.fromJson(json, HashMap.class);
		Money budget = new Money(null, Long.parseLong(data.get("budgetAmount"))); // set
																					// MicroAmount
		Campaign campaign = CreateOneCampaignForAccount(data.get("accountID"), data.get("campaignName"),
				CampaignStatus.fromString(data.get("campaignStatus")), BudgetBudgetPeriod.fromString(data.get("period")), budget);
		// convert result to Json String
		return gson.toJson(campaign);
	}

	@Override
	public Campaign CreateOneCampaignForAccount(String accountID, String campaignName, CampaignStatus campaignStatus, BudgetBudgetPeriod period,
			Money budgetAmount) throws Exception
	{
		AdWordsUser user = new AdWordsUser(email, password, accountID, userAgent, developerToken, useSandbox);

		CampaignServiceInterface campaignService = user.getService(AdWordsService.V201109.CAMPAIGN_SERVICE);
		Campaign campaign = new Campaign();
		campaign.setName(campaignName);
		if (campaignStatus == null)
		{
			campaignStatus = CampaignStatus.PAUSED;
		}
		campaign.setStatus(campaignStatus);
		campaign.setBiddingStrategy(new ManualCPC());

		Budget budget = new Budget();
		if (period == null)
		{
			period = BudgetBudgetPeriod.MONTHLY;
		}
		budget.setPeriod(period);
		budget.setAmount(budgetAmount);
		budget.setDeliveryMethod(BudgetBudgetDeliveryMethod.STANDARD);
		campaign.setBudget(budget);

		CampaignOperation Coperation = new CampaignOperation();
		Coperation.setOperand(campaign);

		Coperation.setOperator(Operator.ADD);
		CampaignOperation[] Coperations = new CampaignOperation[]
		{ Coperation };

		CampaignReturnValue Cresult = campaignService.mutate(Coperations);

		if (Cresult != null && Cresult.getValue() != null)
		{
			return Cresult.getValue()[0];
		}
		else
		{
			System.out.println("No campaigns were added.");
			return null;
		}
	}
	public String AddAdGroup(String json) throws Exception
	{
		logger.debug("call AddAdGroup" + json);
		HashMap<String, String> data = gson.fromJson(json, HashMap.class);
		Long campaignID = Long.parseLong(data.get("campaignID")); 
		Long adGroupID = AddAdGroup(data.get("accountID"),campaignID, data.get("AdGroupName"), AdGroupStatus.fromString(data.get("status")));
		// convert result to Json String
		return gson.toJson(adGroupID);
	}
	@Override
	public Long AddAdGroup(String accountID, Long campaignID, String AdGroupName, AdGroupStatus status) throws Exception
	{     
		AdWordsUser user = new AdWordsUser(email, password, accountID, userAgent, developerToken, useSandbox);    
		// Get the AdGroupService.        
		AdGroupServiceInterface adGroupService = user.getService(AdWordsService.V201109.ADGROUP_SERVICE);          
		long campaignId = campaignID;          
		// Create ad group.       
		AdGroup adGroup = new AdGroup();        
		adGroup.setName(AdGroupName);        
		adGroup.setStatus(status);        
		adGroup.setCampaignId(campaignId);                 
		// Create operations.        
		AdGroupOperation operation = new AdGroupOperation();        
		operation.setOperand(adGroup);       
		operation.setOperator(Operator.ADD);         
		AdGroupOperation[] operations = new AdGroupOperation[]{operation};          
		// Add ad group.       
		AdGroupReturnValue result = adGroupService.mutate(operations);  
		if (result != null && result.getValue() != null)
		{
			return result.getValue()[0].getId();
		}
		else
		{
			return null;
		}
	}

	public String addTextAd(String json) throws Exception
	{
		logger.debug("call addTextAd" + json);
		HashMap<String, String> data = gson.fromJson(json, HashMap.class);
		Long addGroupID = Long.parseLong(data.get("addGroupID")); 
		Long res = addTextAd(data.get("accountID"),addGroupID, data.get("headline"),data.get("description1"),data.get("description2"),data.get("displayURL"),data.get("url"));
		// convert result to Json String
		return gson.toJson(res);
	}
	@Override
	public Long addTextAd(String accountID, Long addGroupID, String headline, String description1, String description2, String displayURL, String url) throws Exception
	{
		AdWordsUser user = new AdWordsUser(email, password, accountID, userAgent, developerToken, useSandbox);          
		// Get the AdGroupAdService.        
		AdGroupAdServiceInterface adGroupAdService =  user.getService(AdWordsService.V201109.ADGROUP_AD_SERVICE);          
		long adGroupId = addGroupID;                 
		// Create text ad.        
		TextAd textAd = new TextAd();        
		textAd.setHeadline(headline);        
		textAd.setDescription1(description1);        
		textAd.setDescription2(description2);        
		textAd.setDisplayUrl(displayURL);        
		textAd.setUrl(url);          
		// Create ad group ad.        
		AdGroupAd textAdGroupAd = new AdGroupAd();        
		textAdGroupAd.setAdGroupId(adGroupId);        
		textAdGroupAd.setAd(textAd); 
		// Create operations.       
		AdGroupAdOperation textAdGroupAdOperation = new AdGroupAdOperation();        
		textAdGroupAdOperation.setOperand(textAdGroupAd);        
		textAdGroupAdOperation.setOperator(Operator.ADD);  

		AdGroupAdOperation[] operations = new AdGroupAdOperation[] {textAdGroupAdOperation};
		AdGroupAdReturnValue result = adGroupAdService.mutate(operations);  
		if (result != null && result.getValue() != null)
		{
			return result.getValue()[0].getAd().getId();
		}
		else
		{
			return null;
		}

	}
	
	public static void main(String[] args)
	{
		
			// Log SOAP XML request and response.
			try
			{
				/*
				AdWordsServiceLogger.log();
				String accountID = "6048920973";
				// Get AdWordsUser from "~/adwords.properties".
				//AdWordsUser user = new AdWordsUser(email, password, "6048920973", userAgent, developerToken, useSandbox);
				GoogleAdwordsServiceImpl g = new GoogleAdwordsServiceImpl();
				AdGroup[] res =  g.getAdGroupsByCampaignId("6048920973", 75239229L, false);
				if (res != null)
				{
				for(int i = 0; i < res.length; i++)
				{
					System.out.println(res[i].getCampaignName() + ":" + res[i].getName());
				}
				}
				Campaign[] camp = g.getCampaignsByAccountId(accountID, false);
				if (camp != null)
				{
					for(int i = 0; i < camp.length; i++)
					{
						System.out.println(camp[i].getName());
					}
				}
				*/
				GoogleAdwordsServiceImpl g = new GoogleAdwordsServiceImpl();
				TargetingIdea[] res = g.GetRelatedKeywords("Red Shoes", KeywordMatchType.EXACT, 20);
				for (int i=0; i< res.length; i++)
				{
					Map<AttributeType, Attribute> data = MapUtils.toMap(res[i].getData());            
					Keyword keyword = (Keyword) ((CriterionAttribute) data.get(AttributeType.CRITERION)).getValue();            
					Long averageMonthlySearches = ((LongAttribute) data.get(AttributeType.AVERAGE_TARGETED_MONTHLY_SEARCHES)).getValue();           
					System.out.println("Keyword with text '" + keyword.getText() + "', match type '"                + keyword.getMatchType() + "', and average monthly search volume '"                + averageMonthlySearches + "' was found.");  
					
				}
			}
			catch (Exception e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
	}

	@Override
	public void addAccountBudget(Money money, String customerId, String orderId) throws Exception
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public String[] getClientAccounts() throws Exception
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Budget[] getAccountBudgets(String customerId) throws Exception
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateAccountBudget(Budget budgetForUpdate, Money money, String customerId, String orderId) throws Exception
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addAccountBudget(DateTimeFloored start, DateTimeCeiling end, Money budget, String string) throws Exception
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateAccountBudgetCannotChangeTheStartDateOfTheCurrentBudget(Budget budgetForUpdate, DateTimeCeiling end, Money newBudgetAmount,
			String string) throws Exception
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public AdGroup[] getAdGroupsByCampaignId(String accountID, Long campaignID, Boolean includeDeleted) throws Exception
	{
		AdWordsUser user = new AdWordsUser(email, password, accountID, userAgent, developerToken, useSandbox);          
		// Get the AdGroupService.        
		AdGroupServiceInterface adGroupService = user.getService(AdWordsService.V201109.ADGROUP_SERVICE);                  
		// Create selector.        
		Selector selector = new Selector();       
		selector.setFields(new String[] {"Id", "Name"});       
		selector.setOrdering(new OrderBy[] {new OrderBy("Name", SortOrder.ASCENDING)});          
		// Create predicates.       
		Predicate campaignIdPredicate =  new Predicate("CampaignId", PredicateOperator.IN, new String[] {campaignID.toString()});        
		selector.setPredicates(new Predicate[] {campaignIdPredicate});          
		// Get all ad groups.       
		AdGroupPage page = adGroupService.get(selector);
		return page.getEntries();
	}

	@Override
	public Campaign[] getCampaignsByAccountId(String accountID, Boolean includeDeleted) throws Exception
	{
		AdWordsUser user = new AdWordsUser(email, password, accountID, userAgent, developerToken, useSandbox); 
		 // Get the CampaignService.        
		CampaignServiceInterface campaignService = user.getService(AdWordsService.V201109.CAMPAIGN_SERVICE);          
		// Create selector.        
		Selector selector = new Selector();        
		selector.setFields(new String[] {"Id", "Name"});        
		selector.setOrdering(new OrderBy[] {new OrderBy("Name", SortOrder.ASCENDING)});                
		// Get all campaigns.        
		CampaignPage page = campaignService.get(selector); 
		return page.getEntries();
	}

	@Override
	public void resumeCampaignById(String customerId, long campaignId) throws Exception
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public AdGroupCriterion[] getAllAdGroupCriteria(String customerId, Long adGroupId) throws Exception
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BiddableAdGroupCriterion[] getAllBiddableAdGroupCriteria(String customerId, Long adGroupId) throws Exception
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String[] getAllAdGroupKeywords(String customerId, Long adGroupId) throws Exception
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AdGroupAd[] getAdsByAdGroupId(String customerId, long adGroupId) throws Exception
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean deleteAD(String accountID, Long adGroupID, Long AdID) throws Exception
	{
		AdWordsUser user = new AdWordsUser(email, password, accountID, userAgent, developerToken, useSandbox);
		// Get the AdGroupAdService.        
		AdGroupAdServiceInterface adGroupAdService = user.getService(AdWordsService.V201109.ADGROUP_AD_SERVICE);                  
		// Create base class ad to avoid setting type specific fields.        
		Ad ad = new Ad();        
		ad.setId(AdID.longValue());          
		// Create ad group ad.        
		AdGroupAd adGroupAd = new AdGroupAd();        
		adGroupAd.setAdGroupId(adGroupID.longValue());        
		adGroupAd.setAd(ad);          
		// Create operations.        
		AdGroupAdOperation operation = new AdGroupAdOperation();        
		operation.setOperand(adGroupAd);        
		operation.setOperator(Operator.REMOVE);          
		AdGroupAdOperation[] operations = new AdGroupAdOperation[] {operation};          
		// Delete ad.       
		AdGroupAdReturnValue result = adGroupAdService.mutate(operations);  
		if (result != null && result.getValue() != null)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	@Override
	public Boolean deleteAdGroup(String accountID, Long adGroupID) throws Exception
	{
		AdWordsUser user = new AdWordsUser(email, password, accountID, userAgent, developerToken, useSandbox);
		// Get the AdGroupService.        
		AdGroupServiceInterface adGroupService =  user.getService(AdWordsService.V201109.ADGROUP_SERVICE);                  
		// Create ad group with DELETED status.       
		AdGroup adGroup = new AdGroup();        
		adGroup.setId(adGroupID.longValue());        
		adGroup.setStatus(AdGroupStatus.DELETED);          
		// Create operations.        
		AdGroupOperation operation = new AdGroupOperation();        
		operation.setOperand(adGroup);        
		operation.setOperator(Operator.SET);          
		AdGroupOperation[] operations = new AdGroupOperation[]{operation};          
		// Delete ad group.       
		AdGroupReturnValue result = adGroupService.mutate(operations);          
		// Display ad groups.        
		if (result != null && result.getValue() != null) 
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	@Override
	public Boolean deleteCampaign(String accountID, Long campaignID) throws Exception
	{
		AdWordsUser user = new AdWordsUser(email, password, accountID, userAgent, developerToken, useSandbox);
		 // Get the CampaignService.       
		CampaignServiceInterface campaignService = user.getService(AdWordsService.V201109.CAMPAIGN_SERVICE);          
	         
		// Create campaign with DELETED status.        
		Campaign campaign = new Campaign();        
		campaign.setId(campaignID.longValue());        
		campaign.setStatus(CampaignStatus.DELETED);          
		// Create operations.        
		CampaignOperation operation = new CampaignOperation();        
		operation.setOperand(campaign);        
		operation.setOperator(Operator.SET);          
		CampaignOperation[] operations = new CampaignOperation[] {operation};          
		// Delete campaign.        
		CampaignReturnValue result = campaignService.mutate(operations);          
		// Display campaigns.        
		if (result != null && result.getValue() != null) 
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	@Override
	public TargetingIdea[] GetRelatedKeywords(String keyword, KeywordMatchType matchType, int numberResults) throws Exception
	{
		AdWordsUser user = new AdWordsUser(email, password, null, userAgent, developerToken, useSandbox);
		 // Get the TargetingIdeaService.        
		TargetingIdeaServiceInterface targetingIdeaService = user.getService(AdWordsService.V201109.TARGETING_IDEA_SERVICE);          
		// Create seed keyword.        
		Keyword keywrd = new Keyword();        
		keywrd.setText(keyword);       
		keywrd.setMatchType(matchType);          
		// Create selector.        
		TargetingIdeaSelector selector = new TargetingIdeaSelector();        
		selector.setRequestType(RequestType.IDEAS);        
		selector.setIdeaType(IdeaType.KEYWORD);        
		selector.setRequestedAttributeTypes(new AttributeType[] {AttributeType.CRITERION,            
				AttributeType.AVERAGE_TARGETED_MONTHLY_SEARCHES});          
		// Set selector paging (required for targeting idea service).        
		Paging paging = new Paging();        
		paging.setStartIndex(0);        
		paging.setNumberResults(numberResults);        
		selector.setPaging(paging);          
		// Create related to keyword search parameter.        
		RelatedToKeywordSearchParameter relatedToKeywordSearchParameter =   new RelatedToKeywordSearchParameter();        
		relatedToKeywordSearchParameter.setKeywords(new Keyword[] {keywrd});         
		// Create keyword match type search parameter to ensure unique results.        
		KeywordMatchTypeSearchParameter keywordMatchTypeSearchParameter = new KeywordMatchTypeSearchParameter();        
		keywordMatchTypeSearchParameter.setKeywordMatchTypes(new KeywordMatchType[] {matchType});          
		selector.setSearchParameters(new SearchParameter[] {relatedToKeywordSearchParameter,keywordMatchTypeSearchParameter});          
		// Get related keywords.        
		TargetingIdeaPage page = targetingIdeaService.get(selector); 
		return page.getEntries(); 
	}

	@Override
	public TargetingIdea[] GetRelatedKeywordsForURL(String URL, KeywordMatchType matchType, int numberResults) throws Exception
	{
		// TODO Auto-generated method stub
		return null;
	}
}
