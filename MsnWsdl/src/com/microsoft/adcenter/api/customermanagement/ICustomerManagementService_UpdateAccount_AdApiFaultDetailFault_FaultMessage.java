
/**
 * ICustomerManagementService_UpdateAccount_AdApiFaultDetailFault_FaultMessage.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis2 version: 1.6.2  Built on : Apr 17, 2012 (05:33:49 IST)
 */

package com.microsoft.adcenter.api.customermanagement;

public class ICustomerManagementService_UpdateAccount_AdApiFaultDetailFault_FaultMessage extends java.lang.Exception{

    private static final long serialVersionUID = 1337717251910L;
    
    private com.microsoft.adapi.AdApiFaultDetailE faultMessage;

    
        public ICustomerManagementService_UpdateAccount_AdApiFaultDetailFault_FaultMessage() {
            super("ICustomerManagementService_UpdateAccount_AdApiFaultDetailFault_FaultMessage");
        }

        public ICustomerManagementService_UpdateAccount_AdApiFaultDetailFault_FaultMessage(java.lang.String s) {
           super(s);
        }

        public ICustomerManagementService_UpdateAccount_AdApiFaultDetailFault_FaultMessage(java.lang.String s, java.lang.Throwable ex) {
          super(s, ex);
        }

        public ICustomerManagementService_UpdateAccount_AdApiFaultDetailFault_FaultMessage(java.lang.Throwable cause) {
            super(cause);
        }
    

    public void setFaultMessage(com.microsoft.adapi.AdApiFaultDetailE msg){
       faultMessage = msg;
    }
    
    public com.microsoft.adapi.AdApiFaultDetailE getFaultMessage(){
       return faultMessage;
    }
}
    