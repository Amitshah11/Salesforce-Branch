@isTest
global class testAPILog{
    @isTest
	 global static void testParse() {
         
      string body='{"id": "evt_1M7IasSGnIeNBZMNvihuGrgb","data":{"object": {"id": "cus_Mr0ccZhORia2eZ",  "email": null,"name": "test", "shipping": null }}}';
 RestRequest req = new RestRequest(); 

 //   req.requestURI = 'https://cloudanalogy-2e2-dev-ed.my.salesforce-sites.com/services/apexrest/stripe';  //Request URL
    req.httpMethod = 'POST';
    req.requestBody = Blob.valueof(body);
    RestContext.request = req;
         
    Test.startTest();
      string ab=   WebhookConnectionWithstripe.createAcc();
      system.assertEquals('cus_Mr0ccZhORia2eZ', ab );
    Test.stopTest();

 
   }
}