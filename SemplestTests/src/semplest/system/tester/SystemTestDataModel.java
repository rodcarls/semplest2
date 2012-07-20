package semplest.system.tester;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import semplest.server.protocol.KeywordIdRemoveOppositePair;
import semplest.server.protocol.ProtocolEnum;
import semplest.server.protocol.ProtocolEnum.EmailType;
import semplest.server.protocol.adengine.BudgetObject;

public class SystemTestDataModel {

	private static final SystemTestDataModel data = new SystemTestDataModel();
	
	//Semplest Variables
	public static final Integer semplestCustomerId = 19; //Customer 'Semplest System Test' in TEST database
	public static final Integer semplestProductGroupId = 120;	
	public static final List<Integer> productGroupIds = Arrays.asList(120);
	public static Integer semplestPromotionId;
	public static String semplestPromotionName;	
	public static final ArrayList<ProtocolEnum.AdEngine> adEngineList = new ArrayList<ProtocolEnum.AdEngine>(Arrays.asList(ProtocolEnum.AdEngine.Google, ProtocolEnum.AdEngine.MSN));
	
	public static final String promotionDescription = "search engine marketing tool";
	
	//Ad Engine Variables
	public static final String googleAccountId = "8258218255";		
	public static Long googleCampaignId;
	public static Long googleAdGroupId;
	
	public static final Long msnAccountId = 1714450L;
	public static final Long msnCustomerId = 13068662L;
	public static Long msnCampaignId;
	public static Long msnAdGroupId;
	
	//ADs
	public static final AD ad1 = data.new AD("Simplest SEM", "Dramatically reduces overhead costs", "No hidden costs or fees");
	public static final AD ad2 = data.new AD("An Amazing SEM Tool", "Dramatically reduces overhead costs", "Dramatically reduces overhead costs");
	public static final List<AD> promotionAds = Arrays.asList(ad1, ad2);
	public static List<Integer> promotionAdIds;	
	
	public static final AD ad3 = data.new AD("Make SEM Simple", "Dramatically reduces overhead costs", "No hidden costs or fees");
	public static final List<AD> promotionAds2 = Arrays.asList(ad3);
	public static List<Integer> promotionAdIds2;
	
	//Keywords (all keywords are set up manually in database)
	public static final List<String> keywords = Arrays.asList("SEM", "Search engine marketing", "online promotion");
	public static final List<Integer> keywordIds = Arrays.asList(154665, 138071, 153406);		
	
	public static final List<String> keywords2 = Arrays.asList("online marketing");
	public static final List<Integer> keywordIds2 = Arrays.asList(153347);
	
	//Negative Keywords		
	public static final List<String> negKeywords = Arrays.asList("startup");
	public static final List<Integer> negKeywordIds = Arrays.asList(154666);		
	public static List<KeywordIdRemoveOppositePair> keywordIdRemoveOppositePairs = new ArrayList<KeywordIdRemoveOppositePair>();
	
	public static final List<String> negKeywords2 = Arrays.asList("marketing");
	public static final List<Integer> negKeywordIds2 = Arrays.asList(154667);		
	public static List<KeywordIdRemoveOppositePair> keywordIdRemoveOppositePairs2 = new ArrayList<KeywordIdRemoveOppositePair>();
	
	//GeoTargeting
	public static final String address = "195 Broadway";
	public static final String city = "New York";
	public static final Integer stateCode = 32;
	public static final String zipCode = "10007";
	public static final Double longitude = -74.009526;
	public static final Double latitude = 40.710798;
	public static final Double radius = 10.00;	
	
	//SiteLinks
	public static final SiteLink siteLink1 = data.new SiteLink("SEMplest");
	public static final SiteLink siteLink2 = data.new SiteLink("semplest");
	public static final List<SiteLink> sitelinks = Arrays.asList(siteLink1, siteLink2);
	
	//Other AdEngine Variables
	public static final Double adEngine_ChangeInBudget = 10.00;
	public static final String adEngine_ValidateUrl1 = "http://www.semplest.com";
	public static final String adEngine_ValidateUrl2 = "www.semplest";
	
	
	//Keyword Service Variables
	public static final String keyword_SearchTerm = "rugby sale balls and gloves";
	public static final String keyword_Description = "rugby sale balls and gloves";
	public static final String keyword_LandingPage = "http://www.planetrugby.com";
	
	//Bidding Service Variables
	public static final Double bidding_TotalMonthlyBudget = 20.00;
	public static final BudgetObject bidding_BudgetData = new BudgetObject(50d,10);
	
	//Mail Service Variables
	public static final String mail_subject = "[Test Mail Service] hello!";
	public static final String mail_from = "nan@semplest.com";
	public static final String mail_recipient = "devuser@semplest.com";
	public static final String mail_msgTxt = "System Test - Mail Service Test";
	public static final String mail_msgType = EmailType.PlanText.getEmailValue();
		
	//Report Variables
	public static String reportName;	
	public static int errorCounter;
	public static int adEngineErrors;
	public static int biddingErrors;
	public static int keywordErrors;
	public static int mailErrors;
	
	//helper classes
	public class AD{
		public String adTitle;
		public String adTextLine1;
		public String adTextLine2;
		
		public AD(String adTitle, String adTextLine1, String adTextLine2) {
			super();
			this.adTitle = adTitle;
			this.adTextLine1 = adTextLine1;
			this.adTextLine2 = adTextLine2;
		}		
	}
	
	public class SiteLink{
		public String linkText;
		public String linkUrl;
		public SiteLink(String linkText) {
			super();
			this.linkText = linkText;
			this.linkUrl = "http://www.semplest.com";
		}		
	}

	public static String printTestData() {
		return "SystemTestDataModel [semplestCustomerId=" + semplestCustomerId
				+ ", semplestProductGroupId=" + semplestProductGroupId
				+ ", productGroupIds=" + productGroupIds
				+ ", semplestPromotionId=" + semplestPromotionId
				+ ", semplestPromotionName=" + semplestPromotionName
				+ ", adEngineList=" + adEngineList + ", promotionDescription="
				+ promotionDescription + ", googleAccountId=" + googleAccountId
				+ ", googleCampaignId=" + googleCampaignId
				+ ", googleAdGroupId=" + googleAdGroupId + ", msnAccountId="
				+ msnAccountId + ", msnCustomerId=" + msnCustomerId
				+ ", msnCampaignId=" + msnCampaignId + ", msnAdGroupId="
				+ msnAdGroupId + ", ad1=" + ad1 + ", ad2=" + ad2
				+ ", promotionAds=" + promotionAds + ", promotionAdIds="
				+ promotionAdIds + ", ad3=" + ad3 + ", promotionAds2="
				+ promotionAds2 + ", promotionAdIds2=" + promotionAdIds2
				+ ", keywords=" + keywords + ", keywordIds=" + keywordIds
				+ ", keywords2=" + keywords2 + ", keywordIds2=" + keywordIds2
				+ ", negKeywords=" + negKeywords + ", negKeywordIds="
				+ negKeywordIds + ", keywordIdRemoveOppositePairs="
				+ keywordIdRemoveOppositePairs + ", negKeywords2="
				+ negKeywords2 + ", negKeywordIds2=" + negKeywordIds2
				+ ", keywordIdRemoveOppositePairs2="
				+ keywordIdRemoveOppositePairs2 + ", address=" + address
				+ ", city=" + city + ", stateCode=" + stateCode + ", zipCode="
				+ zipCode + ", longitude=" + longitude + ", latitude="
				+ latitude + ", radius=" + radius + ", siteLink1=" + siteLink1
				+ ", siteLink2=" + siteLink2 + ", sitelinks=" + sitelinks
				+ ", adEngine_ChangeInBudget=" + adEngine_ChangeInBudget
				+ ", adEngine_ValidateUrl1=" + adEngine_ValidateUrl1
				+ ", adEngine_ValidateUrl2=" + adEngine_ValidateUrl2
				+ ", keyword_SearchTerm=" + keyword_SearchTerm
				+ ", keyword_Description=" + keyword_Description
				+ ", keyword_LandingPage=" + keyword_LandingPage
				+ ", bidding_TotalMonthlyBudget=" + bidding_TotalMonthlyBudget
				+ ", bidding_BudgetData=" + bidding_BudgetData
				+ ", mail_subject=" + mail_subject + ", mail_from=" + mail_from
				+ ", mail_recipient=" + mail_recipient + ", mail_msgTxt="
				+ mail_msgTxt + ", mail_msgType=" + mail_msgType
				+ ", reportName=" + reportName + ", adEngineErrors="
				+ adEngineErrors + ", biddingErrors=" + biddingErrors
				+ ", keywordErrors=" + keywordErrors + ", mailErrors="
				+ mailErrors + "]";
	}
	
}