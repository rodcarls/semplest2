package semplest.server.service.springjdbc.storedproc;

import java.sql.Types;
import java.util.Date;
import java.util.Map;

import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.StoredProcedure;

import semplest.server.service.springjdbc.BaseDB;

public class AddReportDataSP extends StoredProcedure
{
	private static final String SPROC_NAME = "AddReportData";
	
	public AddReportDataSP()
	{
		super(BaseDB.jdbcTemplate.getDataSource(), SPROC_NAME);
		declareParameter(new SqlParameter("PromotionID", Types.INTEGER));
		declareParameter(new SqlParameter("Keyword", Types.NVARCHAR));
		declareParameter(new SqlParameter("AdvertisingEngine", Types.VARCHAR));
		declareParameter(new SqlParameter("TransactionDate", Types.TIMESTAMP));
		declareParameter(new SqlParameter("MicroBidAmount", Types.INTEGER));
		
		declareParameter(new SqlParameter("NumberImpressions", Types.INTEGER));
		declareParameter(new SqlParameter("NumberClick", Types.INTEGER));
		declareParameter(new SqlParameter("AveragePosition", Types.FLOAT));
		declareParameter(new SqlParameter("AverageCPC", Types.FLOAT));
		declareParameter(new SqlParameter("BidType", Types.VARCHAR));
		declareParameter(new SqlParameter("QualityScore", Types.INTEGER));
		declareParameter(new SqlParameter("ApprovalStatus", Types.VARCHAR));
		declareParameter(new SqlParameter("FirstPageMicroCpc", Types.INTEGER));
		declareParameter(new SqlParameter("MicroCost", Types.BIGINT));
		
		compile();
	}
	
	public void execute(int PromotionID, String Keyword,String AdvertisingEngine, Date TransactionDate, Integer MicroBidAmount, 
			Integer NumberImpressions, Integer NumberClick, Float AveragePosition, Float AverageCPC,String BidType, Integer QualityScore, String ApprovalStatus,
			Integer FirstPageMicroCpc, Integer MicroCost) throws Exception
	{
		Map<String, Object> results = super.execute(PromotionID, Keyword,AdvertisingEngine,  TransactionDate,  MicroBidAmount, 
				NumberImpressions, NumberClick, AveragePosition, AverageCPC,BidType, QualityScore, ApprovalStatus,
				FirstPageMicroCpc, MicroCost);
	}
}
