package semplest.server.service.springjdbc.storedproc;

import java.sql.Types;
import java.util.Map;

import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.StoredProcedure;

import semplest.server.service.springjdbc.BaseDB;

public class AddBidSP extends StoredProcedure
{
	private static final String SPROC_NAME = "SetBidObject";
	
	public AddBidSP()
	{
		super(BaseDB.jdbcTemplate.getDataSource(), SPROC_NAME);
		declareParameter(new SqlParameter("ProductGroupPK", Types.INTEGER));
		declareParameter(new SqlParameter("PromotionPK", Types.INTEGER));
		declareParameter(new SqlParameter("KeywordAdEngineID", Types.BIGINT));
		declareParameter(new SqlParameter("Keyword", Types.NVARCHAR));
		declareParameter(new SqlParameter("MicroBidAmount", Types.INTEGER));
		//declareParameter(new SqlParameter("ApprovalStatus", Types.VARCHAR));
		declareParameter(new SqlParameter("BidType", Types.VARCHAR));
		//declareParameter(new SqlParameter("FirstPageMicroCpc", Types.INTEGER));
		//declareParameter(new SqlParameter("QualityScore", Types.INTEGER));
		//declareParameter(new SqlParameter("IsEligibleForShowing", Types.BIT));
		//declareParameter(new SqlParameter("IsBidActive", Types.BIT));
		//declareParameter(new SqlParameter("IsNegative", Types.BIT));
		declareParameter(new SqlParameter("AdvertisingEngine", Types.VARCHAR));
		//declareParameter(new SqlParameter("SemplestProbability", Types.FLOAT));
		
		declareParameter(new SqlOutParameter("ID", Types.INTEGER));
		compile();
	}

	/*
	 * returns KeywordBidPK
	 */
	public Integer execute(int PromotionPK, Integer KeywordAdEngineID, String Keyword, Long MicroBidAmount, String BidType, String AdvertisingEngine) throws Exception
	{
		Map<String, Object> results = super.execute(PromotionPK, KeywordAdEngineID, Keyword,MicroBidAmount, AdvertisingEngine);
		if (results.get("ID") == null)
		{
			return null;
		}
		else
		{
			Integer res = (Integer) results.get("ID");
			if (res == null)
			{
				return null;
			}
			else
			{
				return res;
			}
		}
	}
}