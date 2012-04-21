﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using Newtonsoft.Json;

namespace SemplestWebApp.Services
{
    public class ServiceClientWrapper
    {
        private static String SERVICEOFFERED = "semplest.service.keywords.lda.KeywordGeneratorService";
        private static String BASEURLTEST = "http://VMJAVA1:9898/semplest";
        private static String timeoutMS = "40000";

        public List<string> GetCategories(string companyName, string searchTerm, string description, string[] adds,
                                          string url)
        {
            var jsonHash = new Dictionary<string, string>();
            jsonHash.Add("companyName", companyName);
            jsonHash.Add("searchTerm", searchTerm);
            string jsonAdds = JsonConvert.SerializeObject(adds, Formatting.Indented);
            jsonHash.Add("adds", jsonAdds);
            jsonHash.Add("description", description);
            jsonHash.Add("url", url);
            string jsonstr = JsonConvert.SerializeObject(jsonHash);

            //string returnData = string.Empty;
            string returnData = runMethod(BASEURLTEST, SERVICEOFFERED, "getCategories", jsonstr, timeoutMS);
            //return JsonConvert.DeserializeObject<List<string>>(returnData);

            var dict = JsonConvert.DeserializeObject<Dictionary<string, string>>(returnData);
            List<string> lis = dict.Values.ToList();
            string jsonstrlist = lis[0];
            return JsonConvert.DeserializeObject<List<string>>(jsonstrlist);
        }

        public List<string> GetKeywords(List<string> categories, string companyName, string searchTerm,
                                        string description, string[] adds, string url, Int32[] nGrams)
        {
            var jsonHash = new Dictionary<string, string>();
            String jsonCategories = JsonConvert.SerializeObject(categories);
            jsonHash.Add("categories", jsonCategories);
            jsonHash.Add("companyName", companyName);
            jsonHash.Add("searchTerm", searchTerm);
            string jsonAdds = JsonConvert.SerializeObject(adds, Formatting.Indented);
            jsonHash.Add("adds", jsonAdds);
            jsonHash.Add("description", description);
            jsonHash.Add("url", url);
            nGrams = new[] {50, 50};
            //nGrams = new Int32[] { 1,2,3 };
            string jsonNgrams = JsonConvert.SerializeObject(nGrams);
            jsonHash.Add("nGrams", jsonNgrams);
            string jsonstr = JsonConvert.SerializeObject(jsonHash);

            //string returnData = string.Empty;
            string returnData = runMethod(BASEURLTEST, SERVICEOFFERED, "getKeywords", jsonstr, timeoutMS);
            var dict = JsonConvert.DeserializeObject<Dictionary<string, string>>(returnData);
            List<string> lis = dict.Values.ToList();
            string jsonstrlist = lis[0];

            var listoflist = JsonConvert.DeserializeObject<List<List<string>>>(jsonstrlist);
            var newstrlist = new List<string>();

            foreach (var strlis in listoflist)
            {
                newstrlist.AddRange(strlis);
            }

            return newstrlist;
        }


        public String runMethod(String baseURL, String serviceName, String methodName, String jsonStr, String timeoutMS)
        {
            var client = new WebClient();
            client.QueryString.Add("jsonStr", jsonStr);
            client.QueryString.Add("service", serviceName);
            client.QueryString.Add("method", methodName);

            if (timeoutMS != null)
            {
                client.QueryString.Add("timeout", timeoutMS);
            }

            client.BaseAddress = baseURL;
            string qs = client.QueryString.ToString();
            Stream data = client.OpenRead(baseURL);
            var reader = new StreamReader(data);
            string s = reader.ReadToEnd();

            //WebResource webResource = client.resource(baseURL);
            //return webResource.queryParams(queryParams).get(String.class);
            return s;
        }
    }
}