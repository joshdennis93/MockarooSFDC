public class MockarooSFDC {
    /*  Don't forget to add a Remote Site 'https://my.api.mockaroo.com'.
     *  e.g. MockarooSFDC.createRecords('mockarooschema.json','apikey123456',List<Lead>.class);
     *  Mockaroo dataset output must be JSON.
     *  Field names in Mockaroo must exactly match SF field names
     *  If you need to NOT map a field in Mockaroo to the SF schema, put '__' in front of its name e.g. __nonMapField
     */
    @AuraEnabled(cacheable=true)
    public static List<SObject> createRecords(String apiName, String key, Type sObjectType) {
        String mockEndpoint = 'https://my.api.mockaroo.com/';
        string requestString = mockEndpoint + apiName + '?key=' + key;
        HttpRequest request = new HttpRequest();
        request.setEndpoint(requestString);
        request.setMethod('GET');
        HttpResponse response = (new Http()).send(request);
        if(response.getStatusCode() == 200) {
            List<SObject> objs = (List<SObject>)JSON.deserialize(response.getBody(), sObjectType);
        	upsert objs;
            return objs;
        }
        return null;
    }
}
