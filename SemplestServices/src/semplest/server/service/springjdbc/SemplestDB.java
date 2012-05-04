package semplest.server.service.springjdbc;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;

import semplest.server.protocol.ProtocolEnum.AdEngine;
import semplest.server.protocol.ProtocolEnum.ScheduleFrequency;
import semplest.server.protocol.SemplestSchedulerTaskObject;
import semplest.server.protocol.adengine.AdEngineID;
import semplest.server.protocol.adengine.BidElement;
import semplest.server.protocol.adengine.BudgetObject;
import semplest.server.protocol.adengine.KeywordDataObject;
import semplest.server.protocol.adengine.ReportObject;
import semplest.server.protocol.adengine.TargetedDailyBudget;
import semplest.server.protocol.adengine.TrafficEstimatorDataObject;
import semplest.server.protocol.adengine.TrafficEstimatorObject;
import semplest.server.protocol.adengine.TrafficEstimatorObject.BidData;
import semplest.server.service.springjdbc.helper.AllBidRSExtactor;
import semplest.server.service.springjdbc.helper.AllBiddableRSExtractor;
import semplest.server.service.springjdbc.helper.ScheduleTaskRowMapper;
import semplest.server.service.springjdbc.storedproc.AddBidSP;
import semplest.server.service.springjdbc.storedproc.AddKeywordBidDataSP;
import semplest.server.service.springjdbc.storedproc.AddReportDataSP;
import semplest.server.service.springjdbc.storedproc.AddScheduleSP;
import semplest.server.service.springjdbc.storedproc.AddTaskSP;
import semplest.server.service.springjdbc.storedproc.AddTrafficEstimatorSP;
import semplest.server.service.springjdbc.storedproc.UpdateDefaultBidForKeywordsSP;

public class SemplestDB extends BaseDB
{
	private static final Logger logger = Logger.getLogger(SemplestDB.class);

	/*
	 * Customer
	 */
	private static final RowMapper<CustomerObj> CustomerObjMapper = new BeanPropertyRowMapper(CustomerObj.class);

	public static List<CustomerObj> getAllCustomers()
	{

		String strSQL = "select c.CustomerPK, c.Name, c.TotalTargetCycleBudget, cct.ProductGroupCycleType, cct.CycleInDays, bt.BillType, c.CreatedDate, c.EditedDate from Customer c "
				+ "inner join ProductGroupCycleType cct on c.ProductGroupCycleTypeFK = cct.ProductGroupCycleTypePK "
				+ "inner join BillType bt on c.BillTypeFK = bt.BillTypePK";
		return jdbcTemplate.query(strSQL, CustomerObjMapper); // new
																// CustomerRowMapper());
	}

	/*
	 * public void startTransaction() { jdbcTemplate }
	 */

	/*
	 * Scheduler Calls
	 */
	public static List<TaskRunnerObj> getScheduleTasks(Integer SchedulerPK)
	{
		try
		{
			String strSQL = "select t.ServiceName,t.MethodName,t.Parameters,s.SchedulePK,st.TaskExecutionOrder from Schedule s "
					+ "inner join ScheduleTaskAssociation st on s.SchedulePK = st.ScheduleFK " + "inner join Task t on t.TaskPK = st.TaskFK "
					+ "where s.SchedulePK = ? and s.IsEnabled = 1 " + "order by st.TaskExecutionOrder";
			return jdbcTemplate.query(strSQL, new Object[]
			{ SchedulerPK }, new ScheduleTaskRowMapper());
		}
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public static Integer addSchedule(String ScheduleName, Date StartTime, Date EndDate, String Frequency, boolean isEnabled, boolean isInactive,
			Integer PromotionID, Integer CustomerID, Integer ProductGroupID, Integer UserID) throws Exception
	{

		if (ScheduleFrequency.existsFrequency(Frequency))
		{
			AddScheduleSP addsched = new AddScheduleSP();
			Integer scheduleID = addsched.execute(ScheduleName, StartTime, EndDate, Frequency, isEnabled, isInactive, PromotionID, CustomerID,
					ProductGroupID, UserID);
			return scheduleID;
		}
		else
		{
			throw new Exception("Frequency " + Frequency + " is not valid");
		}

	}

	/*
	 * public static int getFrequencyID(String Frequency) { SqlFunction sf = new
	 * SqlFunction(jdbcTemplate.getDataSource(),
	 * "select FrequencyPK from Frequency f where f.Frequency = '" + Frequency +
	 * "'"); sf.compile(); return sf.run();
	 * 
	 * }
	 */

	public static void associateTaskToSchedule(int ScheduleFK, int TaskFK, int TaskExecutionOrder) throws Exception
	{
		jdbcTemplate.update("insert into ScheduleTaskAssociation(ScheduleFK,TaskFK,TaskExecutionOrder) values (?,?,?)", new Object[]
		{ ScheduleFK, TaskFK, TaskExecutionOrder });
	}

	public static void deleteTask(Integer taskID) throws Exception
	{
		jdbcTemplate.update("delete Task where TaskPK = ?", new Object[]
		{ taskID });
	}

	/*
	 * Note Task execution order is determined by order of
	 * ArrayList<SemplestSchedulerTaskObject> scheduleTaskObjList
	 */
	public static void createTaskAndAssociateToSchedule(int ScheduleFK, ArrayList<SemplestSchedulerTaskObject> scheduleTaskObjList) throws Exception
	{
		AddTaskSP addTask = new AddTaskSP();
		int i = 0;
		for (SemplestSchedulerTaskObject taskObj : scheduleTaskObjList)
		{
			Integer taskID = addTask.execute(taskObj.getClientServiceName(), taskObj.getMethodName(), taskObj.getParameters());
			if (taskID != null)
			{
				associateTaskToSchedule(ScheduleFK, taskID, i);
			}
			i++;
		}
	}

	/*
	 * Bidding calls
	 */

	public static Long getDefaultBid(int promotionID, String adEngine) throws Exception
	{
		String sql = "select aep.MicroDefaultBid from AdvertisingEnginePromotion aep  "
				+ "inner join AdvertisingEngineAccount aea on aea.AdvertisingEngineAccountPK = aep.AdvertisingEngineAccountFK "
				+ "inner join AdvertisingEngine ae on ae.AdvertisingEnginePK = aea.AdvertisingEngineFK "
				+ "where aep.PromotionFK = ? and ae.AdvertisingEngine = ?";

		Integer defBid = (Integer) jdbcTemplate.queryForObject(sql, new Object[]
		{ promotionID, adEngine }, Integer.class);
		if (defBid != null)
		{
			return new Long(defBid);
		}
		else
		{
			return null;
		}

	}
	
	public static void storeDefaultBid(int promotionID, String adEngine, Long microDefaultBid) throws Exception
	{
		Integer microBid =  microDefaultBid.intValue();
		String sql = "update AdvertisingEnginePromotion set MicroDefaultBid = ?  " +
				"from AdvertisingEnginePromotion aep  " +
				"inner join AdvertisingEngineAccount aea on aea.AdvertisingEngineAccountPK = aep.AdvertisingEngineAccountFK " +
				"inner join AdvertisingEngine ae on ae.AdvertisingEnginePK = aea.AdvertisingEngineFK " +
				"where aep.PromotionFK = ? and ae.AdvertisingEngine = ?";

		jdbcTemplate.update(sql, new Object[]
		{ microBid, promotionID, adEngine });

	}
	
	public static void UpdateDefaultBidForKeywords(int promotionID, String adEngine) throws Exception
	{
		UpdateDefaultBidForKeywordsSP updateDefBiAmounts = new UpdateDefaultBidForKeywordsSP();
		updateDefBiAmounts.execute(promotionID, adEngine);
	}

	public static void storeTargetedDailyBudget(int promotionID, String AdEngine, Long TargetedDailyMicroBudget, Integer TargetedDailyClicks)
			throws Exception
	{
		jdbcTemplate.update(
				"insert into TargetedDailyBudget(PromotionFK, AdvertisingEngineFK,TargetedDailyBudgetPK,TargetedDailyClicks,CreatedDate) "
						+ "select ?,a.AdvertisingEnginePK,?,?,CURRENT_TIMESTAMP from AdvertisingEngine a where a.AdvertisingEngine = ?", new Object[]
				{ promotionID, TargetedDailyMicroBudget, TargetedDailyClicks, AdEngine });

	}

	public static void storeTrafficEstimatorData(int promotionID, String AdEngine, TrafficEstimatorObject trafficEstimatorObj) throws Exception
	{
		AddTrafficEstimatorSP addTrafficEstSP = new AddTrafficEstimatorSP();
		HashMap<String, HashMap<String, HashMap<Long, BidData>>> trafficData = trafficEstimatorObj.getBidDataMap();
		// go through each keyword
		if (trafficData.keySet().isEmpty())
		{
			return;
		}
		Iterator<String> keywords = trafficData.keySet().iterator();
		while (keywords.hasNext())
		{
			String keyword = keywords.next();
			HashMap<String, HashMap<Long, BidData>> matchTypeMap = trafficData.get(keyword);
			// go through match types
			if (matchTypeMap != null && matchTypeMap.size() > 0)
			{
				Iterator<String> matchTypes = matchTypeMap.keySet().iterator();
				while (matchTypes.hasNext())
				{
					String matchType = matchTypes.next();
					// get the map of points
					HashMap<Long, BidData> biddata = matchTypeMap.get(matchType);
					if (biddata != null && biddata.size() > 0)
					{
						Iterator<Long> microbids = biddata.keySet().iterator();
						while (microbids.hasNext())
						{
							Long microBid = microbids.next();
							// add the data to the DB
							addTrafficEstSP.execute(promotionID, keyword, AdEngine, matchType, microBid,
									trafficEstimatorObj.getAveTotalDailyMicroCost(keyword, matchType, microBid),
									trafficEstimatorObj.getAveClickPerDay(keyword, matchType, microBid),
									trafficEstimatorObj.getAvePosition(keyword, matchType, microBid),
									trafficEstimatorObj.getAveCPC(keyword, matchType, microBid));
						}
					}
				}
			}
		}
	}

	public static void storeKeywordDataObjects(int promotionID, String AdEngine, ArrayList<KeywordDataObject> keywordDataObjectList) throws Exception
	{
		AddKeywordBidDataSP addKeywordBidDataSP = new AddKeywordBidDataSP();
		if (keywordDataObjectList != null && keywordDataObjectList.size() > 0)
		{
			for (int i = 0; i < keywordDataObjectList.size(); i++)
			{
				KeywordDataObject kdObj = keywordDataObjectList.get(i);
				addKeywordBidDataSP.execute(promotionID, kdObj.getKeyword(), AdEngine, kdObj.getMatchType(), kdObj.getQualityScore(),
						kdObj.getApprovalStatus(), kdObj.getFirstPageCpc(), kdObj.isIsEligibleForShowing());
			}
		}
	}

	private static final RowMapper<BidElement> bidElementMapper = new BeanPropertyRowMapper(BidElement.class);

	public static List<BidElement> getLatestBids(int promotionID, String searchEngine) throws Exception
	{
		String strSQL = "select kb.KeywordAdEngineID, k.Keyword,kb.MicroBidAmount,bt.BidType,kb.CompetitionType, kb.StartDate from Promotion p  "
				+ "inner join KeywordBid kb on kb.PromotionFK = p.PromotionPK "
				+ "inner join AdvertisingEngine ae on ae.AdvertisingEnginePK = kb.AdvertisingEngineFK "
				+ "inner join Keyword k on k.KeywordPK = kb.KeywordFK " + "inner join BidType bt on bt.BidTypePK = kb.BidTypeFK "
				+ "where p.PromotionPK = ? and kb.MicroBidAmount != -1 and ae.AdvertisingEngine = ? and kb.IsActive = 1";
		return jdbcTemplate.query(strSQL, new Object[]
		{ promotionID, searchEngine }, bidElementMapper);
	}

	public static HashMap<String, ArrayList<BidElement>> getAllBids(int promotionID, String searchEngine, Date startDate, Date endDate)
			throws Exception
	{

		String strSQL = null;
		java.sql.Date startDateSQL = new java.sql.Date(startDate.getTime());
		if (endDate == null)
		{
			strSQL = "select kb.KeywordAdEngineID, k.Keyword, kb.MicroBidAmount, bt.BidType, kb.CompetitionType,kb.StartDate, kb.EndDate, kb.IsDefaultValue, kb.IsActive from KeywordBid kb "
					+ "inner join AdvertisingEngine ae on ae.AdvertisingEnginePK = kb.AdvertisingEngineFK "
					+ "inner join Keyword k on k.KeywordPK = kb.KeywordFK "
					+ "inner join BidType bt on bt.BidTypePK = kb.BidTypeFK "
					+ "where kb.PromotionFK = ?  and kb.MicroBidAmount != -1 and ae.AdvertisingEngine = ? and kb.StartDate >= ? "
					+ "order by k.Keyword";
			return jdbcTemplate.query(strSQL, new Object[]
			{ promotionID, searchEngine, startDateSQL }, new AllBidRSExtactor());
		}
		else
		{
			java.sql.Date endDateSQL = new java.sql.Date(endDate.getTime());
			strSQL = "select kb.KeywordAdEngineID, k.Keyword, kb.MicroBidAmount, bt.BidType, kb.CompetitionType,kb.StartDate, kb.EndDate, kb.IsDefaultValue, kb.IsActive from KeywordBid kb "
					+ "inner join AdvertisingEngine ae on ae.AdvertisingEnginePK = kb.AdvertisingEngineFK "
					+ "inner join Keyword k on k.KeywordPK = kb.KeywordFK "
					+ "inner join BidType bt on bt.BidTypePK = kb.BidTypeFK "
					+ "where kb.PromotionFK = ? and kb.MicroBidAmount != -1 and ae.AdvertisingEngine = ? and (kb.StartDate >= ? and kb.EndDate <= ?)"
					+ "order by k.Keyword";
			return jdbcTemplate.query(strSQL, new Object[]
			{ promotionID, searchEngine, startDateSQL, endDateSQL }, new AllBidRSExtactor());
		}

	}

	private static final RowMapper<KeywordDataObject> bidObjMapper = new BeanPropertyRowMapper(KeywordDataObject.class);

	/*
	 * This get the last created KeywordBid Data for all keywords associated
	 * with campaign
	 */
	public static List<KeywordDataObject> getLatestBiddableAdGroupCriteria(Integer promotionID, String advertisingEngine) throws Exception
	{
		if (!AdEngine.existsAdEngine(advertisingEngine))
		{
			throw new Exception(advertisingEngine + " Not Found");
		}
		String strSQL = "select kb.KeywordAdEngineID,k.Keyword,kb.MicroBidAmount,ki.ApprovalStatus,b.BidType, ki.FirstPageMicroCPC, "
				+ "ki.QualityScore,ki.IsEligibleForShowing,p.IsNegative, ki.CreatedDate from KeywordBid kb  "
				+ "inner join PromotionKeywordAssociation pka on pka.PromotionFK = kb.PromotionFK "
				+ "inner join Keyword k on k.KeywordPK = pka.KeywordFK inner join PromotionKeywordAssociation p on p.KeywordFK = k.KeywordPK "
				+ "inner join BidType b on b.BidTypePK = kb.BidTypeFK  " + "inner join KeywordBidData ki on ki.KeywordBidFK = kb.KeywordBidPK "
				+ "inner join AdvertisingEngine a on a.AdvertisingEnginePK = kb.AdvertisingEngineFK " + "inner join  "
				+ "(select kbd.KeywordBidFK,MAX(kbd.CreatedDate) [lastDate]  from KeywordBidData kbd "
				+ "group by kbd.KeywordBidFK) mkbd on mkbd.KeywordBidFK = kb.KeywordBidPK and mkbd.lastDate = kb.CreatedDate "
				+ "where pka.PromotionFK = ? and a.AdvertisingEngine = ?";
		return jdbcTemplate.query(strSQL, new Object[]
		{ promotionID, advertisingEngine }, bidObjMapper);
	}

	public static HashMap<String, ArrayList<KeywordDataObject>> getAllBiddableAdGroupCriteria(Integer promotionID, String adEngine, Date startDate,
			Date endDate)
	{
		String strSQL = null;
		java.sql.Date startDateSQL = new java.sql.Date(startDate.getTime());
		if (endDate == null)
		{
			strSQL = "select kb.KeywordAdEngineID,k.Keyword,kb.MicroBidAmount,ki.ApprovalStatus,b.BidType, ki.FirstPageMicroCPC, "
					+ "ki.QualityScore,ki.IsEligibleForShowing,p.IsNegative,ki.CreatedDate from KeywordBid kb  "
					+ "inner join PromotionKeywordAssociation pka on pka.PromotionFK = kb.PromotionFK "
					+ "inner join Keyword k on k.KeywordPK = pka.KeywordFK inner join PromotionKeywordAssociation p on p.KeywordFK = k.KeywordPK "
					+ "inner join BidType b on b.BidTypePK = kb.BidTypeFK  " + "inner join KeywordBidData ki on ki.KeywordBidFK = kb.KeywordBidPK "
					+ "inner join AdvertisingEngine a on a.AdvertisingEnginePK = kb.AdvertisingEngineFK " + "inner join  "
					+ "(select kbd.KeywordBidFK,MAX(kbd.CreatedDate) [lastDate]  from KeywordBidData kbd "
					+ "group by kbd.KeywordBidFK) mkbd on mkbd.KeywordBidFK = kb.KeywordBidPK and mkbd.lastDate = kb.CreatedDate "
					+ "where pka.PromotionFK = ? and a.AdvertisingEngine = ? and ki.CreatedDate >= ?";

			return jdbcTemplate.query(strSQL, new Object[]
			{ promotionID, adEngine, startDateSQL }, new AllBiddableRSExtractor());
		}
		else
		{
			java.sql.Date endDateSQL = new java.sql.Date(endDate.getTime());
			strSQL = "select kb.KeywordAdEngineID,k.Keyword,kb.MicroBidAmount,ki.ApprovalStatus,b.BidType, ki.FirstPageMicroCPC, "
					+ "ki.QualityScore,ki.IsEligibleForShowing,p.IsNegative, ki.CreatedDate from KeywordBid kb  "
					+ "inner join PromotionKeywordAssociation pka on pka.PromotionFK = kb.PromotionFK "
					+ "inner join Keyword k on k.KeywordPK = pka.KeywordFK inner join PromotionKeywordAssociation p on p.KeywordFK = k.KeywordPK "
					+ "inner join BidType b on b.BidTypePK = kb.BidTypeFK  " + "inner join KeywordBidData ki on ki.KeywordBidFK = kb.KeywordBidPK "
					+ "inner join AdvertisingEngine a on a.AdvertisingEnginePK = kb.AdvertisingEngineFK " + "inner join  "
					+ "(select kbd.KeywordBidFK,MAX(kbd.CreatedDate) [lastDate]  from KeywordBidData kbd "
					+ "group by kbd.KeywordBidFK) mkbd on mkbd.KeywordBidFK = kb.KeywordBidPK and mkbd.lastDate = kb.CreatedDate "
					+ "where pka.PromotionFK = ? and a.AdvertisingEngine = ? and ki.CreatedDate >= ? and ki.CreatedDate <= ?";
			return jdbcTemplate.query(strSQL, new Object[]
			{ promotionID, adEngine, startDateSQL, endDateSQL }, new AllBiddableRSExtractor());
		}
	}

	private static final RowMapper<TrafficEstimatorDataObject> trafficEstDataObjMapper = new BeanPropertyRowMapper(TrafficEstimatorDataObject.class);

	/*
	 * This get the last created Traffic Estimator Data for one keyword
	 * associated with campaign
	 */
	public static List<TrafficEstimatorDataObject> getLatestTrafficEstimatorForKeyword(Integer promotionID, String keyword, String advertisingEngine)
			throws Exception
	{
		if (!AdEngine.existsAdEngine(advertisingEngine))
		{
			throw new Exception(advertisingEngine + " Not Found");
		}
		String strSQL = "select kb.KeywordAdEngineID,k.Keyword,kb.MicroBidAmount,te.MicroBid, te.AveMicroCost, te.AveNumberClicks, te.AvePosition,te.AveCPC,b.BidType,p.IsNegative, te.CreatedDate "
				+ "from KeywordBid kb "
				+ "inner join PromotionKeywordAssociation pka on pka.PromotionFK = kb.PromotionFK "
				+ "inner join Keyword k on k.KeywordPK = pka.KeywordFK inner join PromotionKeywordAssociation p on p.KeywordFK = k.KeywordPK "
				+ "inner join BidType b on b.BidTypePK = kb.BidTypeFK  "
				+ "inner join TrafficEstimator te on te.KeywordBidFK = kb.KeywordBidPK "
				+ "inner join AdvertisingEngine a on a.AdvertisingEnginePK = kb.AdvertisingEngineFK "
				+ "inner join  "
				+ "(select te.KeywordBidFK,MAX(te.CreatedDate) [lastDate]  from TrafficEstimator te "
				+ "group by te.KeywordBidFK) mte on te.KeywordBidFK = kb.KeywordBidPK and mte.lastDate = te.CreatedDate "
				+ "where pka.PromotionFK = ? and k.Keyword = ? and a.AdvertisingEngine = ?";
		return jdbcTemplate.query(strSQL, new Object[]
		{ promotionID, keyword, advertisingEngine }, trafficEstDataObjMapper);
	}

	/*
	 * public static List<TrafficEstimatorDataObject>
	 * getAllTrafficEstimatorForKeyword(Integer promotionID, String keyword,
	 * String adEngine, Date startDate, Date endDate ) { String strSQL = null;
	 * java.sql.Date startDateSQL = new java.sql.Date(startDate.getTime()); if
	 * (endDate == null) { strSQL =
	 * "select kb.KeywordAdEngineID,k.Keyword,kb.MicroBidAmount,te.MicroBid, te.AveMicroCost, te.AveNumberClicks, te.AvePosition,te.AveCPC ,b.BidType,p.IsNegative, te.CreatedDate  "
	 * + "from KeywordBid kb  " +
	 * "inner join PromotionKeywordAssociation pka on pka.PromotionFK = kb.PromotionFK "
	 * +
	 * "inner join Keyword k on k.KeywordPK = pka.KeywordFK inner join PromotionKeywordAssociation p on p.KeywordFK = k.KeywordPK "
	 * + "inner join BidType b on b.BidTypePK = kb.BidTypeFK  " +
	 * "inner join TrafficEstimator te on te.KeywordBidFK = kb.KeywordBidPK " +
	 * "inner join AdvertisingEngine a on a.AdvertisingEnginePK = kb.AdvertisingEngineFK "
	 * +
	 * "where pka.PromotionFK = ?  and k.Keyword = ? and a.AdvertisingEngine = ? and te.CreatedDate >= ? "
	 * ;
	 * 
	 * return jdbcTemplate.query(strSQL, new Object[] { promotionID, keyword,
	 * adEngine, startDateSQL },trafficEstDataObjMapper); } else { java.sql.Date
	 * endDateSQL = new java.sql.Date(endDate.getTime()); strSQL =
	 * "select kb.KeywordAdEngineID,k.Keyword,kb.MicroBidAmount,te.MicroBid, te.AveMicroCost, te.AveNumberClicks, te.AvePosition,te.AveCPC ,b.BidType,p.IsNegative, te.CreatedDate  "
	 * + "from KeywordBid kb  " +
	 * "inner join PromotionKeywordAssociation pka on pka.PromotionFK = kb.PromotionFK "
	 * +
	 * "inner join Keyword k on k.KeywordPK = pka.KeywordFK inner join PromotionKeywordAssociation p on p.KeywordFK = k.KeywordPK "
	 * + "inner join BidType b on b.BidTypePK = kb.BidTypeFK  " +
	 * "inner join TrafficEstimator te on te.KeywordBidFK = kb.KeywordBidPK " +
	 * "inner join AdvertisingEngine a on a.AdvertisingEnginePK = kb.AdvertisingEngineFK "
	 * +
	 * "where pka.PromotionFK = ?  and k.Keyword = ? and a.AdvertisingEngine = ? and te.CreatedDate >= ? and te.CreatedDate <= ?"
	 * ; return jdbcTemplate.query(strSQL, new Object[] { promotionID, keyword,
	 * adEngine, startDateSQL, endDateSQL }, trafficEstDataObjMapper); } }
	 */
	private static final RowMapper<BudgetObject> BudgetObjMapper = new BeanPropertyRowMapper(BudgetObject.class);

	public static BudgetObject getBudget(int promotionID, String searchEngine) throws Exception
	{

		String strSQL = "select p.RemainingBudgetInCycle, DATEDIFF(dd,p.CycleEndDate,CURRENT_TIMESTAMP) [RemainingDays] from Promotion p where PromotionPK = ?";
		return jdbcTemplate.queryForObject(strSQL, new Object[]
		{ promotionID }, BudgetObjMapper);
	}

	public static void storeBidObjects(int promotionID, String advertisingEngine, ArrayList<BidElement> bidObjects) throws Exception
	{
		if (!AdEngine.existsAdEngine(advertisingEngine))
		{
			throw new Exception(advertisingEngine + " Not Found");
		}
		if (bidObjects != null && bidObjects.size() > 0)
		{
			AddBidSP addBid = new AddBidSP();
			for (BidElement bid : bidObjects)
			{
				try
				{
					addBid.execute(promotionID, bid.getKeywordAdEngineID(), bid.getKeyword(), bid.getMicroBidAmount(), bid.getMatchType(),
							advertisingEngine);
					logger.info("Added Keyword " + bid.getKeyword() + " MicroBid " + bid.getMicroBidAmount());
				}
				catch (Exception e)
				{
					logger.error("Strore Bid Object Error " + bid.getKeyword() + ":" + e.getMessage());
					e.printStackTrace();
				}
			}
		}
	}

	/*
	 * Report calls
	 */

	public static void storeAdvertisingEngineReportData(String adEngine, List<ReportObject> reportObjList) throws Exception
	{
		AddReportDataSP setReportSP = new AddReportDataSP();
		for (ReportObject rptObj : reportObjList)
		{
			setReportSP.execute(rptObj.getAccountID(), rptObj.getCampaignID(), rptObj.getKeyword(), new java.sql.Date(rptObj.getTransactionDate()
					.getTime()), rptObj.getMicroBidAmount(), rptObj.getBidMatchType(), rptObj.getNumberImpressions(), rptObj.getNumberClick(), rptObj
					.getAveragePosition(), rptObj.getAverageCPC(), rptObj.getQualityScore(), rptObj.getApprovalStatus(), rptObj.getFirstPageCPC(),
					rptObj.getMicroCost());
			logger.info(rptObj.getKeyword());
		}
	}

	private static final RowMapper<ReportObject> reportObjectjMapper = new BeanPropertyRowMapper(ReportObject.class);

	public static List<ReportObject> getReportData(int promotionID, String adEngine, java.util.Date startDate, java.util.Date endDate)
			throws Exception
	{

		if (!AdEngine.existsAdEngine(adEngine))
		{
			throw new Exception(adEngine + " Not Found");
		}
		String strSQL = null;
		java.sql.Date startDateSQL = new java.sql.Date(startDate.getTime());
		if (endDate == null)
		{
			strSQL = "select aep.AdvertisingEngineAccountFK [AccountID],aep.AdvertisingEngineCampaignPK [CampaignID],k.Keyword,aerd.TransactionDate,aerd.MicroBidAmount, "
					+ "bt.BidType,aerd.NumberImpressions, aerd.NumberClick,aerd.AveragePosition,aerd.AverageCPC,aerd.QualityScore,aerd.ApprovalStatus,aerd.FirstPageMicroCPC,aerd.CreatedDate,aerd.MicroCost  "
					+ "from AdvertisingEngineReportData aerd "
					+ "inner join KeywordBid kb on kb.KeywordBidPK = aerd.KeywordBidFK "
					+ "inner join Keyword k on k.KeywordPK = kb.KeywordFK "
					+ "inner join AdvertisingEngine ae on ae.AdvertisingEnginePK = kb.AdvertisingEngineFK "
					+ "inner join Promotion p on p.PromotionPK = kb.PromotionFK "
					+ "inner join AdvertisingEnginePromotion aep on p.PromotionPK = aep.PromotionFK "
					+ "inner join BidType bt on bt.BidTypePK = kb.BidTypeFK "
					+ "where p.PromotionPK = ? and ae.AdvertisingEngine = ? and aerd.CreatedDate >= ?";
			return jdbcTemplate.query(strSQL, new Object[]
			{ promotionID, adEngine, startDateSQL }, reportObjectjMapper);
		}
		else
		{
			java.sql.Date endDateSQL = new java.sql.Date(endDate.getTime());
			strSQL = "select aep.AdvertisingEngineAccountFK [AccountID],aep.AdvertisingEngineCampaignPK [CampaignID],k.Keyword,aerd.TransactionDate,aerd.MicroBidAmount, "
					+ "bt.BidType,aerd.NumberImpressions, aerd.NumberClick,aerd.AveragePosition,aerd.AverageCPC,aerd.QualityScore,aerd.ApprovalStatus,aerd.FirstPageMicroCPC,aerd.CreatedDate,aerd.MicroCost  "
					+ "from AdvertisingEngineReportData aerd "
					+ "inner join KeywordBid kb on kb.KeywordBidPK = aerd.KeywordBidFK "
					+ "inner join Keyword k on k.KeywordPK = kb.KeywordFK "
					+ "inner join AdvertisingEngine ae on ae.AdvertisingEnginePK = kb.AdvertisingEngineFK "
					+ "inner join Promotion p on p.PromotionPK = kb.PromotionFK "
					+ "inner join AdvertisingEnginePromotion aep on p.PromotionPK = aep.PromotionFK "
					+ "inner join BidType bt on bt.BidTypePK = kb.BidTypeFK "
					+ "where p.PromotionPK = ? and ae.AdvertisingEngine = ? and aerd.CreatedDate >= ? and aerd.CreatedDate <= ?";
			return jdbcTemplate.query(strSQL, new Object[]
			{ promotionID, adEngine, startDateSQL, endDateSQL }, reportObjectjMapper);
		}
	}

	private static final RowMapper<TargetedDailyBudget> targetedDailyBudgetMapper = new BeanPropertyRowMapper(TargetedDailyBudget.class);

	public static TargetedDailyBudget getLatestTargetedDailyBudget(int promotionID, String adEngine) throws Exception
	{

		if (!AdEngine.existsAdEngine(adEngine))
		{
			throw new Exception(adEngine + " Not Found");
		}
		String strSQL = "select top 1 tdb.TargetedDailyMicroBudget, tdb.TargetedDailyClicks,tdb.CreatedDate from TargetedDailyBudget tdb "
				+ "inner join AdvertisingEngine ae on ae.AdvertisingEnginePK = tdb.AdvertisingEngineFK "
				+ "where tdb.PromotionFK = ? and ae.AdvertisingEngine = ? " + "order by tdb.CreatedDate";

		return jdbcTemplate.queryForObject(strSQL, new Object[]
		{ promotionID, adEngine }, targetedDailyBudgetMapper);
	}

	public static List<TargetedDailyBudget> getAllTargetedDailyBudget(int promotionID, String adEngine, java.util.Date startDate,
			java.util.Date endDate) throws Exception
	{

		if (!AdEngine.existsAdEngine(adEngine))
		{
			throw new Exception(adEngine + " Not Found");
		}
		String strSQL = null;
		java.sql.Date startDateSQL = new java.sql.Date(startDate.getTime());
		if (endDate == null)
		{
			strSQL = "select tdb.TargetedDailyMicroBudget, tdb.TargetedDailyClicks,tdb.CreatedDate from TargetedDailyBudget tdb "
					+ "inner join AdvertisingEngine ae on ae.AdvertisingEnginePK = tdb.AdvertisingEngineFK "
					+ "where tdb.PromotionFK = ? and ae.AdvertisingEngine = ? and tdb.CreatedDate >= ?";

			return jdbcTemplate.query(strSQL, new Object[]
			{ promotionID, adEngine, startDateSQL }, targetedDailyBudgetMapper);
		}
		else
		{
			java.sql.Date endDateSQL = new java.sql.Date(endDate.getTime());
			strSQL = "select tdb.TargetedDailyMicroBudget, tdb.TargetedDailyClicks,tdb.CreatedDate from TargetedDailyBudget tdb "
					+ "inner join AdvertisingEngine ae on ae.AdvertisingEnginePK = tdb.AdvertisingEngineFK "
					+ "where tdb.PromotionFK = ? and ae.AdvertisingEngine = ? and tdb.CreatedDate >= ? and tdb.CreatedDate <= ?";

			return jdbcTemplate.query(strSQL, new Object[]
			{ promotionID, adEngine, startDateSQL, endDateSQL }, targetedDailyBudgetMapper);
		}
	}

	/*
	 * Account calls
	 */
	private static final RowMapper<AdEngineID> adEngineObjMapper = new BeanPropertyRowMapper(AdEngineID.class);

	public static AdEngineID getAdEngineID(Integer customerID, String adEngine) throws Exception
	{
		String strSQL = "select aec.AdvertisingEngineAccountPK [AccountID], aep.AdvertisingEngineCampaignPK [CampaignID], p.AdEngineAdGroupID [AdGroupID] from Customer c "
				+ "inner join AdvertisingEngineAccount aec on aec.CustomerFK = c.CustomerPK "
				+ "inner join AdvertisingEngine ae on ae.AdvertisingEnginePK = aec.AdvertisingEngineFK"
				+ "inner join AdvertisingEnginePromotion aep on aec.AdvertisingEngineAccountPK = aep.AdvertisingEngineAccountFK "
				+ "inner join Promotion p on aep.PromotionFK = p.PromotionPK " + "where c.CustomerPK = ? and ae.AdvertisingEngine = ?";
		return jdbcTemplate.queryForObject(strSQL, new Object[]
		{ customerID, adEngine }, adEngineObjMapper);
	}

	private static final RowMapper<AdvertisingEnginePromotionObj> advertisingEnginePromotionObjMapper = new BeanPropertyRowMapper(
			AdvertisingEnginePromotionObj.class);

	public static List<AdvertisingEnginePromotionObj> getAdvertisingEnginePromotion(Long advertisingEngineAccountID) throws Exception
	{
		String strSQL = "Select ap.AdvertisingEngineAccountFK [AdvertisingEngineAccountID],ap.AdvertisingEngineCampaignPK [AdvertisingEngineCampaignID],"
				+ "ap.PromotionFK [PromotionID], ap.IsSearchNetwork,ap.IsDisplayNetwork,ap.AdvertisingEngineBudget "
				+ "from AdvertisingEnginePromotion ap where ap.AdvertisingEngineAccountFK = ?";
		return jdbcTemplate.query(strSQL, new Object[]
		{ advertisingEngineAccountID }, advertisingEnginePromotionObjMapper);
	}

	/*
	 * return Hashmap - Keys: AccountID, CustomerName
	 */
	public static List getAdEngineAccount(int customerID, String adEngine) throws Exception
	{
		String strSQL = "select ae.AdvertisingEngineAccountPK [AccountID], c.Name [CustomerName] from Customer c "
				+ "left join AdvertisingEngineAccount a on c.CustomerPK = a.CustomerFK "
				+ "left join AdvertisingEngine ae on ae.AdvertisingEnginePK = a.AdvertisingEngineFK "
				+ "where c.CustomerPK = ? and (ae.AdvertisingEngine is null or ae.AdvertisingEngine = ?)";

		return jdbcTemplate.queryForList(strSQL, new Object[]
		{ customerID, adEngine });

	}

	public static Integer addAdEngineAccountID(int customerID, Long accountID, String adEngine) throws Exception
	{
		String strSQL = "insert into AdvertisingEngineAccount(AdvertisingEngineAccountPK,AdvertisingEngineFK,CustomerFK) "
				+ "select ? ,ae.AdvertisingEnginePK, ? from AdvertisingEngine ae where ae.AdvertisingEngine = ?";

		return jdbcTemplate.update(strSQL, new Object[]
		{ accountID, customerID, adEngine });

	}

	public static Integer addPromotionToAdEngineAccountID(int promotionID, Long adEngineAccountID, Long adEngineCampaignID) throws Exception
	{
		String strSQL = "insert into AdvertisingEnginePromotion(AdvertisingEngineCampaignPK,PromotionFK,AdvertisingEngineAccountFK,IsSearchNetwork,IsDisplayNetwork,AdvertisingEngineBudget) "
				+ "VALUES (?,?,?,?,?)";

		return jdbcTemplate.update(strSQL, new Object[]
		{ adEngineCampaignID, promotionID, adEngineAccountID, 1, 0, 0.0 });

	}

	public static Integer updatePromotionToAdEngineAccountID(Long adEngineCampaignID, boolean IsSearchNetwork, boolean IsDisplayNetwork,
			Double AdvertisingEngineBudget) throws Exception
	{
		String strSQL = "update AdvertisingEnginePromotion set IsSearchNetwork = ?, IsDisplayNetwork = ?,AdvertisingEngineBudget = ? where AdvertisingEngineCampaignPK = ?";

		return jdbcTemplate.update(strSQL, new Object[]
		{ IsSearchNetwork, IsDisplayNetwork, AdvertisingEngineBudget, adEngineCampaignID });

	}

	private static final RowMapper<PromotionObj> promotionObjMapper = new BeanPropertyRowMapper(PromotionObj.class);

	public static List<PromotionObj> getPromotionObjects(Integer promotionID) throws Exception
	{
		String strSQL = " select p.PromotionPK,p.ProductGroupFK,p.PromotionName,p.PromotionDescription,p.LandingPageURL,"
				+ "p.CycleBudgetAmount,p.StartDate,p.EditedDate,p.IsPaused,p.CreatedDate,p.EditedDate from Promotion p where p.PromotionPK = ?";
		return jdbcTemplate.query(strSQL, new Object[]
		{ promotionID }, promotionObjMapper);
	}

}
