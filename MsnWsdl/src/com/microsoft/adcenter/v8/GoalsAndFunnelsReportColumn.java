
/**
 * GoalsAndFunnelsReportColumn.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis2 version: 1.6.2  Built on : Apr 17, 2012 (05:34:40 IST)
 */

            
                package com.microsoft.adcenter.v8;
            

            /**
            *  GoalsAndFunnelsReportColumn bean class
            */
            @SuppressWarnings({"unchecked","unused"})
        
        public  class GoalsAndFunnelsReportColumn
        implements org.apache.axis2.databinding.ADBBean{
        
                public static final javax.xml.namespace.QName MY_QNAME = new javax.xml.namespace.QName(
                "https://adcenter.microsoft.com/v8",
                "GoalsAndFunnelsReportColumn",
                "ns4");

            

                        /**
                        * field for GoalsAndFunnelsReportColumn
                        */

                        
                                    protected java.lang.String localGoalsAndFunnelsReportColumn ;
                                
                            private static java.util.HashMap _table_ = new java.util.HashMap();

                            // Constructor
                            
                                protected GoalsAndFunnelsReportColumn(java.lang.String value, boolean isRegisterValue) {
                                    localGoalsAndFunnelsReportColumn = value;
                                    if (isRegisterValue){
                                        
                                               _table_.put(localGoalsAndFunnelsReportColumn, this);
                                           
                                    }

                                }
                            
                                    public static final java.lang.String _AccountName =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("AccountName");
                                
                                    public static final java.lang.String _AccountNumber =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("AccountNumber");
                                
                                    public static final java.lang.String _AccountId =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("AccountId");
                                
                                    public static final java.lang.String _TimePeriod =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("TimePeriod");
                                
                                    public static final java.lang.String _CampaignName =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("CampaignName");
                                
                                    public static final java.lang.String _CampaignId =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("CampaignId");
                                
                                    public static final java.lang.String _AdGroupName =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("AdGroupName");
                                
                                    public static final java.lang.String _AdGroupId =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("AdGroupId");
                                
                                    public static final java.lang.String _Keyword =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("Keyword");
                                
                                    public static final java.lang.String _KeywordId =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("KeywordId");
                                
                                    public static final java.lang.String _Goal =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("Goal");
                                
                                    public static final java.lang.String _Step1Count =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("Step1Count");
                                
                                    public static final java.lang.String _Step2Count =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("Step2Count");
                                
                                    public static final java.lang.String _Step3Count =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("Step3Count");
                                
                                    public static final java.lang.String _Step4Count =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("Step4Count");
                                
                                    public static final java.lang.String _Step5Count =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("Step5Count");
                                
                                    public static final java.lang.String _Conversions =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("Conversions");
                                
                                    public static final java.lang.String _Assists =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("Assists");
                                
                                    public static final java.lang.String _FunnelConversionRate =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("FunnelConversionRate");
                                
                                    public static final java.lang.String _Spend =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("Spend");
                                
                                    public static final java.lang.String _Revenue =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("Revenue");
                                
                                    public static final java.lang.String _ReturnOnAdSpend =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("ReturnOnAdSpend");
                                
                                    public static final java.lang.String _ExtendedCost =
                                        org.apache.axis2.databinding.utils.ConverterUtil.convertToString("ExtendedCost");
                                
                                public static final GoalsAndFunnelsReportColumn AccountName =
                                    new GoalsAndFunnelsReportColumn(_AccountName,true);
                            
                                public static final GoalsAndFunnelsReportColumn AccountNumber =
                                    new GoalsAndFunnelsReportColumn(_AccountNumber,true);
                            
                                public static final GoalsAndFunnelsReportColumn AccountId =
                                    new GoalsAndFunnelsReportColumn(_AccountId,true);
                            
                                public static final GoalsAndFunnelsReportColumn TimePeriod =
                                    new GoalsAndFunnelsReportColumn(_TimePeriod,true);
                            
                                public static final GoalsAndFunnelsReportColumn CampaignName =
                                    new GoalsAndFunnelsReportColumn(_CampaignName,true);
                            
                                public static final GoalsAndFunnelsReportColumn CampaignId =
                                    new GoalsAndFunnelsReportColumn(_CampaignId,true);
                            
                                public static final GoalsAndFunnelsReportColumn AdGroupName =
                                    new GoalsAndFunnelsReportColumn(_AdGroupName,true);
                            
                                public static final GoalsAndFunnelsReportColumn AdGroupId =
                                    new GoalsAndFunnelsReportColumn(_AdGroupId,true);
                            
                                public static final GoalsAndFunnelsReportColumn Keyword =
                                    new GoalsAndFunnelsReportColumn(_Keyword,true);
                            
                                public static final GoalsAndFunnelsReportColumn KeywordId =
                                    new GoalsAndFunnelsReportColumn(_KeywordId,true);
                            
                                public static final GoalsAndFunnelsReportColumn Goal =
                                    new GoalsAndFunnelsReportColumn(_Goal,true);
                            
                                public static final GoalsAndFunnelsReportColumn Step1Count =
                                    new GoalsAndFunnelsReportColumn(_Step1Count,true);
                            
                                public static final GoalsAndFunnelsReportColumn Step2Count =
                                    new GoalsAndFunnelsReportColumn(_Step2Count,true);
                            
                                public static final GoalsAndFunnelsReportColumn Step3Count =
                                    new GoalsAndFunnelsReportColumn(_Step3Count,true);
                            
                                public static final GoalsAndFunnelsReportColumn Step4Count =
                                    new GoalsAndFunnelsReportColumn(_Step4Count,true);
                            
                                public static final GoalsAndFunnelsReportColumn Step5Count =
                                    new GoalsAndFunnelsReportColumn(_Step5Count,true);
                            
                                public static final GoalsAndFunnelsReportColumn Conversions =
                                    new GoalsAndFunnelsReportColumn(_Conversions,true);
                            
                                public static final GoalsAndFunnelsReportColumn Assists =
                                    new GoalsAndFunnelsReportColumn(_Assists,true);
                            
                                public static final GoalsAndFunnelsReportColumn FunnelConversionRate =
                                    new GoalsAndFunnelsReportColumn(_FunnelConversionRate,true);
                            
                                public static final GoalsAndFunnelsReportColumn Spend =
                                    new GoalsAndFunnelsReportColumn(_Spend,true);
                            
                                public static final GoalsAndFunnelsReportColumn Revenue =
                                    new GoalsAndFunnelsReportColumn(_Revenue,true);
                            
                                public static final GoalsAndFunnelsReportColumn ReturnOnAdSpend =
                                    new GoalsAndFunnelsReportColumn(_ReturnOnAdSpend,true);
                            
                                public static final GoalsAndFunnelsReportColumn ExtendedCost =
                                    new GoalsAndFunnelsReportColumn(_ExtendedCost,true);
                            

                                public java.lang.String getValue() { return localGoalsAndFunnelsReportColumn;}

                                public boolean equals(java.lang.Object obj) {return (obj == this);}
                                public int hashCode() { return toString().hashCode();}
                                public java.lang.String toString() {
                                
                                        return localGoalsAndFunnelsReportColumn.toString();
                                    

                                }

                        

     
     
        /**
        *
        * @param parentQName
        * @param factory
        * @return org.apache.axiom.om.OMElement
        */
       public org.apache.axiom.om.OMElement getOMElement (
               final javax.xml.namespace.QName parentQName,
               final org.apache.axiom.om.OMFactory factory) throws org.apache.axis2.databinding.ADBException{


        
               org.apache.axiom.om.OMDataSource dataSource =
                       new org.apache.axis2.databinding.ADBDataSource(this,MY_QNAME);
               return factory.createOMElement(dataSource,MY_QNAME);
            
        }

         public void serialize(final javax.xml.namespace.QName parentQName,
                                       javax.xml.stream.XMLStreamWriter xmlWriter)
                                throws javax.xml.stream.XMLStreamException, org.apache.axis2.databinding.ADBException{
                           serialize(parentQName,xmlWriter,false);
         }

         public void serialize(final javax.xml.namespace.QName parentQName,
                               javax.xml.stream.XMLStreamWriter xmlWriter,
                               boolean serializeType)
            throws javax.xml.stream.XMLStreamException, org.apache.axis2.databinding.ADBException{
            
                
                //We can safely assume an element has only one type associated with it
                
                            java.lang.String namespace = parentQName.getNamespaceURI();
                            java.lang.String _localName = parentQName.getLocalPart();
                        
                            writeStartElement(null, namespace, _localName, xmlWriter);

                            // add the type details if this is used in a simple type
                               if (serializeType){
                                   java.lang.String namespacePrefix = registerPrefix(xmlWriter,"https://adcenter.microsoft.com/v8");
                                   if ((namespacePrefix != null) && (namespacePrefix.trim().length() > 0)){
                                       writeAttribute("xsi","http://www.w3.org/2001/XMLSchema-instance","type",
                                           namespacePrefix+":GoalsAndFunnelsReportColumn",
                                           xmlWriter);
                                   } else {
                                       writeAttribute("xsi","http://www.w3.org/2001/XMLSchema-instance","type",
                                           "GoalsAndFunnelsReportColumn",
                                           xmlWriter);
                                   }
                               }
                            
                                          if (localGoalsAndFunnelsReportColumn==null){
                                            
                                                     throw new org.apache.axis2.databinding.ADBException("GoalsAndFunnelsReportColumn cannot be null !!");
                                                
                                         }else{
                                        
                                                       xmlWriter.writeCharacters(localGoalsAndFunnelsReportColumn);
                                            
                                         }
                                    
                            xmlWriter.writeEndElement();
                    

        }

        private static java.lang.String generatePrefix(java.lang.String namespace) {
            if(namespace.equals("https://adcenter.microsoft.com/v8")){
                return "ns4";
            }
            return org.apache.axis2.databinding.utils.BeanUtil.getUniquePrefix();
        }

        /**
         * Utility method to write an element start tag.
         */
        private void writeStartElement(java.lang.String prefix, java.lang.String namespace, java.lang.String localPart,
                                       javax.xml.stream.XMLStreamWriter xmlWriter) throws javax.xml.stream.XMLStreamException {
            java.lang.String writerPrefix = xmlWriter.getPrefix(namespace);
            if (writerPrefix != null) {
                xmlWriter.writeStartElement(namespace, localPart);
            } else {
                if (namespace.length() == 0) {
                    prefix = "";
                } else if (prefix == null) {
                    prefix = generatePrefix(namespace);
                }

                xmlWriter.writeStartElement(prefix, localPart, namespace);
                xmlWriter.writeNamespace(prefix, namespace);
                xmlWriter.setPrefix(prefix, namespace);
            }
        }
        
        /**
         * Util method to write an attribute with the ns prefix
         */
        private void writeAttribute(java.lang.String prefix,java.lang.String namespace,java.lang.String attName,
                                    java.lang.String attValue,javax.xml.stream.XMLStreamWriter xmlWriter) throws javax.xml.stream.XMLStreamException{
            if (xmlWriter.getPrefix(namespace) == null) {
                xmlWriter.writeNamespace(prefix, namespace);
                xmlWriter.setPrefix(prefix, namespace);
            }
            xmlWriter.writeAttribute(namespace,attName,attValue);
        }

        /**
         * Util method to write an attribute without the ns prefix
         */
        private void writeAttribute(java.lang.String namespace,java.lang.String attName,
                                    java.lang.String attValue,javax.xml.stream.XMLStreamWriter xmlWriter) throws javax.xml.stream.XMLStreamException{
            if (namespace.equals("")) {
                xmlWriter.writeAttribute(attName,attValue);
            } else {
                registerPrefix(xmlWriter, namespace);
                xmlWriter.writeAttribute(namespace,attName,attValue);
            }
        }


           /**
             * Util method to write an attribute without the ns prefix
             */
            private void writeQNameAttribute(java.lang.String namespace, java.lang.String attName,
                                             javax.xml.namespace.QName qname, javax.xml.stream.XMLStreamWriter xmlWriter) throws javax.xml.stream.XMLStreamException {

                java.lang.String attributeNamespace = qname.getNamespaceURI();
                java.lang.String attributePrefix = xmlWriter.getPrefix(attributeNamespace);
                if (attributePrefix == null) {
                    attributePrefix = registerPrefix(xmlWriter, attributeNamespace);
                }
                java.lang.String attributeValue;
                if (attributePrefix.trim().length() > 0) {
                    attributeValue = attributePrefix + ":" + qname.getLocalPart();
                } else {
                    attributeValue = qname.getLocalPart();
                }

                if (namespace.equals("")) {
                    xmlWriter.writeAttribute(attName, attributeValue);
                } else {
                    registerPrefix(xmlWriter, namespace);
                    xmlWriter.writeAttribute(namespace, attName, attributeValue);
                }
            }
        /**
         *  method to handle Qnames
         */

        private void writeQName(javax.xml.namespace.QName qname,
                                javax.xml.stream.XMLStreamWriter xmlWriter) throws javax.xml.stream.XMLStreamException {
            java.lang.String namespaceURI = qname.getNamespaceURI();
            if (namespaceURI != null) {
                java.lang.String prefix = xmlWriter.getPrefix(namespaceURI);
                if (prefix == null) {
                    prefix = generatePrefix(namespaceURI);
                    xmlWriter.writeNamespace(prefix, namespaceURI);
                    xmlWriter.setPrefix(prefix,namespaceURI);
                }

                if (prefix.trim().length() > 0){
                    xmlWriter.writeCharacters(prefix + ":" + org.apache.axis2.databinding.utils.ConverterUtil.convertToString(qname));
                } else {
                    // i.e this is the default namespace
                    xmlWriter.writeCharacters(org.apache.axis2.databinding.utils.ConverterUtil.convertToString(qname));
                }

            } else {
                xmlWriter.writeCharacters(org.apache.axis2.databinding.utils.ConverterUtil.convertToString(qname));
            }
        }

        private void writeQNames(javax.xml.namespace.QName[] qnames,
                                 javax.xml.stream.XMLStreamWriter xmlWriter) throws javax.xml.stream.XMLStreamException {

            if (qnames != null) {
                // we have to store this data until last moment since it is not possible to write any
                // namespace data after writing the charactor data
                java.lang.StringBuffer stringToWrite = new java.lang.StringBuffer();
                java.lang.String namespaceURI = null;
                java.lang.String prefix = null;

                for (int i = 0; i < qnames.length; i++) {
                    if (i > 0) {
                        stringToWrite.append(" ");
                    }
                    namespaceURI = qnames[i].getNamespaceURI();
                    if (namespaceURI != null) {
                        prefix = xmlWriter.getPrefix(namespaceURI);
                        if ((prefix == null) || (prefix.length() == 0)) {
                            prefix = generatePrefix(namespaceURI);
                            xmlWriter.writeNamespace(prefix, namespaceURI);
                            xmlWriter.setPrefix(prefix,namespaceURI);
                        }

                        if (prefix.trim().length() > 0){
                            stringToWrite.append(prefix).append(":").append(org.apache.axis2.databinding.utils.ConverterUtil.convertToString(qnames[i]));
                        } else {
                            stringToWrite.append(org.apache.axis2.databinding.utils.ConverterUtil.convertToString(qnames[i]));
                        }
                    } else {
                        stringToWrite.append(org.apache.axis2.databinding.utils.ConverterUtil.convertToString(qnames[i]));
                    }
                }
                xmlWriter.writeCharacters(stringToWrite.toString());
            }

        }


        /**
         * Register a namespace prefix
         */
        private java.lang.String registerPrefix(javax.xml.stream.XMLStreamWriter xmlWriter, java.lang.String namespace) throws javax.xml.stream.XMLStreamException {
            java.lang.String prefix = xmlWriter.getPrefix(namespace);
            if (prefix == null) {
                prefix = generatePrefix(namespace);
                javax.xml.namespace.NamespaceContext nsContext = xmlWriter.getNamespaceContext();
                while (true) {
                    java.lang.String uri = nsContext.getNamespaceURI(prefix);
                    if (uri == null || uri.length() == 0) {
                        break;
                    }
                    prefix = org.apache.axis2.databinding.utils.BeanUtil.getUniquePrefix();
                }
                xmlWriter.writeNamespace(prefix, namespace);
                xmlWriter.setPrefix(prefix, namespace);
            }
            return prefix;
        }


  
        /**
        * databinding method to get an XML representation of this object
        *
        */
        public javax.xml.stream.XMLStreamReader getPullParser(javax.xml.namespace.QName qName)
                    throws org.apache.axis2.databinding.ADBException{


        
                
                //We can safely assume an element has only one type associated with it
                 return new org.apache.axis2.databinding.utils.reader.ADBXMLStreamReaderImpl(MY_QNAME,
                            new java.lang.Object[]{
                            org.apache.axis2.databinding.utils.reader.ADBXMLStreamReader.ELEMENT_TEXT,
                            org.apache.axis2.databinding.utils.ConverterUtil.convertToString(localGoalsAndFunnelsReportColumn)
                            },
                            null);

        }

  

     /**
      *  Factory class that keeps the parse method
      */
    public static class Factory{

        
        
                public static GoalsAndFunnelsReportColumn fromValue(java.lang.String value)
                      throws java.lang.IllegalArgumentException {
                    GoalsAndFunnelsReportColumn enumeration = (GoalsAndFunnelsReportColumn)
                       
                               _table_.get(value);
                           

                    if ((enumeration == null) && !((value == null) || (value.equals("")))) {
                        throw new java.lang.IllegalArgumentException();
                    }
                    return enumeration;
                }
                public static GoalsAndFunnelsReportColumn fromString(java.lang.String value,java.lang.String namespaceURI)
                      throws java.lang.IllegalArgumentException {
                    try {
                       
                                       return fromValue(org.apache.axis2.databinding.utils.ConverterUtil.convertToString(value));
                                   

                    } catch (java.lang.Exception e) {
                        throw new java.lang.IllegalArgumentException();
                    }
                }

                public static GoalsAndFunnelsReportColumn fromString(javax.xml.stream.XMLStreamReader xmlStreamReader,
                                                                    java.lang.String content) {
                    if (content.indexOf(":") > -1){
                        java.lang.String prefix = content.substring(0,content.indexOf(":"));
                        java.lang.String namespaceUri = xmlStreamReader.getNamespaceContext().getNamespaceURI(prefix);
                        return GoalsAndFunnelsReportColumn.Factory.fromString(content,namespaceUri);
                    } else {
                       return GoalsAndFunnelsReportColumn.Factory.fromString(content,"");
                    }
                }
            

        /**
        * static method to create the object
        * Precondition:  If this object is an element, the current or next start element starts this object and any intervening reader events are ignorable
        *                If this object is not an element, it is a complex type and the reader is at the event just after the outer start element
        * Postcondition: If this object is an element, the reader is positioned at its end element
        *                If this object is a complex type, the reader is positioned at the end element of its outer element
        */
        public static GoalsAndFunnelsReportColumn parse(javax.xml.stream.XMLStreamReader reader) throws java.lang.Exception{
            GoalsAndFunnelsReportColumn object = null;
                // initialize a hash map to keep values
                java.util.Map attributeMap = new java.util.HashMap();
                java.util.List extraAttributeList = new java.util.ArrayList<org.apache.axiom.om.OMAttribute>();
            

            int event;
            java.lang.String nillableValue = null;
            java.lang.String prefix ="";
            java.lang.String namespaceuri ="";
            try {
                
                while (!reader.isStartElement() && !reader.isEndElement())
                    reader.next();

                

                
                // Note all attributes that were handled. Used to differ normal attributes
                // from anyAttributes.
                java.util.Vector handledAttributes = new java.util.Vector();
                

                   
                while(!reader.isEndElement()) {
                    if (reader.isStartElement()  || reader.hasText()){
                
                                    nillableValue = reader.getAttributeValue("http://www.w3.org/2001/XMLSchema-instance","nil");
                                    if ("true".equals(nillableValue) || "1".equals(nillableValue)){
                                        throw new org.apache.axis2.databinding.ADBException("The element: "+"GoalsAndFunnelsReportColumn" +"  cannot be null");
                                    }
                                    

                                    java.lang.String content = reader.getElementText();
                                    
                                        if (content.indexOf(":") > 0) {
                                            // this seems to be a Qname so find the namespace and send
                                            prefix = content.substring(0, content.indexOf(":"));
                                            namespaceuri = reader.getNamespaceURI(prefix);
                                            object = GoalsAndFunnelsReportColumn.Factory.fromString(content,namespaceuri);
                                        } else {
                                            // this seems to be not a qname send and empty namespace incase of it is
                                            // check is done in fromString method
                                            object = GoalsAndFunnelsReportColumn.Factory.fromString(content,"");
                                        }
                                        
                                        
                             } else {
                                reader.next();
                             }  
                           }  // end of while loop
                        



            } catch (javax.xml.stream.XMLStreamException e) {
                throw new java.lang.Exception(e);
            }

            return object;
        }

        }//end of factory class

        

        }
           
    