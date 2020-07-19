global class GenerateTestData {
    @InvocableMethod(label='Generate test data' description='Generate data from Mockaroo using supplied variables.')
    /* Given this is to be used in Flow, assume input data is a list.
     * see https://www.youtube.com/watch?v=872cA1miBE4&feature=youtu.be
     * Mapping needed to convert user input e.g. 'Account' to its class.
     */
    public static void GenerateTestData(List<GenerateTestDataRequest> requests) {
        String listType = 'List<' + requests[0].objString + '>';
        Type sObj = Type.forname(listType);
        MockarooSFDC.createRecords(requests[0].apiName,requests[0].key,sObj);
    }

    global class GenerateTestDataRequest {
        @InvocableVariable(label='API Name' required=true)
        global String apiName;

        @InvocableVariable(label='API Key' required=true)
        global String key;

        @InvocableVariable(label='sObjectType' required=true)
        global String objString;
    }
}
