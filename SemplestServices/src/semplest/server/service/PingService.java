package semplest.server.service;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.UnknownHostException;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

import semplest.client.nio.NIOClient;
import semplest.client.nio.NIOResponseHandler;
import semplest.server.protocol.ProtocolJSON;
import semplest.server.protocol.ProtocolSocketDataObject;
import semplest.server.service.queue.ServiceActiveMQConnection;

public class PingService implements Runnable
{
	private Socket pingSocket;
	private ESBConnectionData connectionData = null;
	private final int frequencyMS;
	private final String serviceName;
	private ServiceActiveMQConnection mq = null;
	ProtocolSocketDataObject pingData = null;
	private ProtocolJSON json = new ProtocolJSON();
	private ServiceShutdown shutdown = null;
	static final Logger logger = Logger.getLogger(PingService.class);

	//
	public static void main(String[] args)
	{

	}

	public PingService(ESBConnectionData connectionData)
	{
		this.connectionData = connectionData;
		this.frequencyMS = connectionData.getPingFrequencyMS();
		this.serviceName = connectionData.getServiceName();
		//
		pingData = new ProtocolSocketDataObject();
		pingData.setHeader(ProtocolJSON.SEMplest_PING);
		pingData.setclientServiceName(serviceName);

	}

	@Override
	public void run()
	{
		try
		{
			// Registration loop
			while (true)
			{
				if (registerServiceWithESB())
				{
					byte[] bytes = new byte[300]; // 178 bytes coming back in
													// response
					String jsonStr = json.createJSONFromSocketDataObj(pingData);
					byte[] returnData = ProtocolJSON.createBytePacketFromString(jsonStr);
					// Starting pinging until there is an error
					int retry = 0;
					while (true)
					{
						try
						{
							if (retry < 3)
							{
								logger.debug("Send Ping");
								pingSocket.getOutputStream().write(returnData);
								pingSocket.getOutputStream().flush();
								// wait for return data
								int numBytes = pingSocket.getInputStream().read(bytes);
								logger.debug("Read bytes pingSocket = " + numBytes + ":" + bytes.toString());
								Thread.sleep(frequencyMS);
							}
							else
							{
								pingSocket = null;
								logger.error("Unable to PIng the ESB Server...it may be down?  Will try to register again in 5 seconds");
								Thread.sleep(5000);
								break;
							}
						}
						catch (Exception e)
						{
							retry++;
							logger.info("Ping Service failed for " + this.serviceName + " will try again....in 5 seconds " + retry + ":" + e.getMessage());
							Thread.sleep(5000);
							connectSocket();
							e.printStackTrace();
						}
					}

				}
				else
				{
					logger.error("Unable to register...will try again in 10 seconds");
					Thread.sleep(10000);
				}
			}
		}
		catch (Exception e)
		{
			logger.error("Unexpected Error in Ping Service...Terminating");
			return;
		}
	}
	
	private boolean connectSocket()
	{
		if (pingSocket == null || pingSocket.isClosed() || !pingSocket.isConnected())
		{
			try
			{
				pingSocket = new Socket(connectionData.getServerURI(), Integer.parseInt(connectionData.getServerport()));
				return true;
			}
			catch (Exception e)
			{
				logger.error("Error connecting socket " + e.getMessage() );
				e.printStackTrace();
				return false;
			}
			
		}
		else if (pingSocket != null && pingSocket.isConnected())
		{
			return true;
		}
		else
		{
			logger.error("Socket not connected...");
			return false;		
		}
	}

	private boolean registerServiceWithESB()
	{

		try
		{
			logger.debug("Reg with ESB " + connectionData.getServerURI() + ":" + connectionData.getServerport());
			// create a Thread to connect via socket
			if (!connectSocket())
			{
				return false;
			}

			// add shutdown hook
			if (shutdown == null)
			{
				shutdown = new ServiceShutdown(pingSocket, connectionData.getServiceName(), connectionData.getServiceOffered());
				Thread shutdownHook = new Thread(shutdown);
				Runtime.getRuntime().addShutdownHook(shutdownHook);
			}
			// create the register packet
			ProtocolSocketDataObject regdata = new ProtocolSocketDataObject();
			regdata.setHeader(ProtocolJSON.SEMplest_REGISTER);
			regdata.setclientServiceName(connectionData.getServiceName());
			regdata.setServiceOffered(connectionData.getServiceOffered());
			regdata.setPingFrequency(connectionData.getESBPingWaitMS());

			// convert to JSON
			String jsonStr = json.createJSONFromSocketDataObj(regdata);
			byte[] regPacket = ProtocolJSON.createBytePacketFromString(jsonStr);
			logger.debug("Send regPacket " + jsonStr);
			// send the Registration pacjket
			pingSocket.getOutputStream().write(regPacket);
			pingSocket.getOutputStream().flush();
			// wait synchronously for response
			byte[] response = new byte[8192];
			int num = pingSocket.getInputStream().read(response);
			// create ProtocolSocketDataObject from response
			ProtocolSocketDataObject data = json.createSocketDataObjFromJSON(ProtocolJSON.convertbytesToString(response));
			logger.debug("Response REC - " + data.getclientServiceName() + ":" + data.getServiceOffered() + ": ping Freq=" + data.getPingFrequency()
					+ ": Header=" + data.getheader());
			if (data.getheader() == ProtocolJSON.SEMplest_REGISTER)
			{
				// create a connection to the destination queue
				logger.debug("setting up MQ IP: " + data.getmessageQueueIP() + ":" + data.getmessageQueuePort() + " sendQ="
						+ data.getServiceSendQueueName() + " RecQ=" + data.getServiceRecQueueName());
				mq = new ServiceActiveMQConnection(data.getmessageQueueIP(), data.getmessageQueuePort());
				mq.createProducer(data.getServiceSendQueueName());
				mq.createConsumer(data.getServiceRecQueueName());

				logger.info("Service registered " + data.getServiceSendQueueName());
			}
			else
			{
				logger.error("ERROR - The Data Header rec from ESB was not SEMplest REGISTER");
				return false;
			}
			logger.debug("Done with Reg to ESB");
			return true;
		}
		catch (Exception e)
		{
			logger.error(e.getMessage());
			e.printStackTrace();
			return false;
		}
	}

}
