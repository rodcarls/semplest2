package semplest.test.other;

import java.util.Date;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;


public class SCtest {

	public static void main(String args[]){
		
		try{		
			System.out.println("Start Time: " + new Date());
			System.out.println(" ");
			
			//Start to Test
			ExecutorService executor = Executors.newCachedThreadPool();					
			
			//Test Service
			/*
			executor.execute(new ServiceTestThread(3000));	
			Thread.sleep(10);
			executor.execute(new ServiceTestThread(3000));
			Thread.sleep(10);
			executor.execute(new ServiceTestThread(3000));
			*/
			
			executor.execute(new KeywordTestThread(3000));
	
		}
		catch(Exception e){
			e.printStackTrace();			
		}
		
	}
}
