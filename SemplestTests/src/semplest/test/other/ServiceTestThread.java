package semplest.test.other;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

public class ServiceTestThread implements Runnable{

	private int sleep_time;	
	private String reportPath;
	private FileWriter writer;
	
	public ServiceTestThread(int sleep_time) {
		super();
		this.sleep_time = sleep_time;
	}

	@Override
	public void run() {
		try{	
			
			String reportName = "EsbTest_" + System.currentTimeMillis();
			
			reportPath = "Z:\\TestReports\\PerformanceTest\\" + reportName + ".csv";		
			writer = new FileWriter(reportPath);	 
		    //writer.append("Computation");
		   // writer.append(',');
		    writer.append("Latency");
		    writer.append('\n');
		 
			while(true){
				Date now = new Date();				
				System.out.println("TEST SERVICE >>> " 
				+ now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds());
				
				TestService2Client ts = new TestService2Client(null);
				
				long start = System.currentTimeMillis();
				String ret = ts.TestMethod("nan");	
				long time = System.currentTimeMillis() - start;
				System.out.println("--- " + ret + " >>> " + time);
				
				//String[] ret1 = ret.split("=");
				//writer.append(ret1[1]);
			    //writer.append(',');
			    writer.append(String.valueOf(time));
			    writer.append('\n');  			
			    
			    writer.flush();
				
				Thread.sleep(sleep_time);				
			}
		}
		catch(Exception e){
			e.printStackTrace();		
			try {
				writer.append("ERROR:");
				writer.append('\n');
				writer.append(e.getMessage());
				StackTraceElement[] ste = e.getStackTrace();
				for(StackTraceElement s : ste){
					writer.append(s.getClassName());
					writer.append(',');
					writer.append(s.getMethodName());
					writer.append(',');
					writer.append(String.valueOf(s.getLineNumber()));
					writer.append(',');
					writer.append('\n');
				}				
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		finally{
			try {				
				writer.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		    
		}
	}		
}
