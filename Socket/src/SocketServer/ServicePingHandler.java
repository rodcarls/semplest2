package SocketServer;

import java.net.Socket;
import java.util.Vector;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.log4j.Logger;



public class ServicePingHandler implements Runnable
{
	//private final Socket socket;
	private final String client;
	private String serviceName = null;
	private int pingFrequencyPlusDelayMS;
	private final String serviceOffered;
	
	//private final int delayMS = 500; 
	
	static final Logger logger = Logger.getLogger(ServicePingHandler.class);
	
	public ServicePingHandler(String service, String serviceOffered, int pingFrequencyMS)
	{
		//this.socket = socket;
		this.client = service;
		this.serviceOffered = serviceOffered;
		this.pingFrequencyPlusDelayMS = pingFrequencyMS;
	}
	public synchronized boolean handleResponse(String serviceName)
	{
		this.serviceName = serviceName;
		this.notify();
		return true;
	}

	public synchronized void waitForResponse()
	{
		while (pingFrequencyPlusDelayMS == 0 || this.serviceName == null)
		{
			try
			{
				this.wait(pingFrequencyPlusDelayMS);
				if (this.serviceName == null)
				{
					logger.debug("No response from client: " + client);
					/*
					 * remove client
					 */
					removeClient();
					return;
				}
				else
				{
					logger.debug("Got response from " + serviceName);
					this.serviceName = null;
				}
			}
			catch (InterruptedException e)
			{
				logger.debug("Ping Wait for Response error " + e.getMessage());
				removeClient();
				return;
			}
		}

	}
	private void removeClient()
	{
		logger.debug("Removing: " + client);
		/*ConcurrentHashMap<String, ServiceRegistrationData> serviceRegistrationMap = ESBServer.esb.getServiceRegistrationMap();
		Vector<String> servicesList = ESBServer.esb.getServiceNameList(serviceRegistrationMap.get(client).getServiceOffered());
		if (serviceRegistrationMap.containsKey(client))
		{
			serviceRegistrationMap.remove(client);
			logger.debug(client + "removed in registrationMap size=" + serviceRegistrationMap.size() );
			if (servicesList.contains(client))
			{	
				servicesList.remove(client);
			}
			logger.debug("Removed: " + client);
		}
		else
		{
			logger.debug(client + "not in registrationMap" );
		}
		*/
		
	}
	@Override
	public void run()
	{
		waitForResponse();
		
	}

}
