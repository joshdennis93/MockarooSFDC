# MockarooSFDC
Simple class &amp; flow allowing user to generate test data from Mockaroo.

## INSTALLATION/SETUP:
1. Clone/download files in repo
2. Use your favourite metadata management tool to add them to your current metadata and push to your org. Or, simply copy/paste code into the dev console?
3. Ensure Remote Site is set up correctly (pointing to https://my.api.mockaroo.com)
4. Create account & a schema at mockaroo.com. Ensure fields you create match API names of matching SFDC fields. Once finished, ensure the format is JSON and press the 'Create API...' button.
5. Press 'Save Changes'. Make sure to copy your API Key (top-right hand corner) and the resulting name of the API (in the Route textbox), making sure to remove the leading / (e.g. 'Account.json', not '/Account.json').
6. Test in execute anonymous by executing MockarooSFDC.createRecords('yourapi.json','yourapikey',List<YOUROBJECT>.class);

Note that this is in Source format rather than Metadata API format.

## USAGE:
MockarooSFDC.cls calls out to Mockaroo using your specified API key & the name of the schema created. Ensure that the schema's field names match your Salesforce API names exactly - e.g. Name in SF = Name in Mockaroo, ExampleField__c in SF = ExampleField__c in Mockaroo.

Example usage of the class: MockarooSFDC.createRecords('Account.json','apikey123456',List<Account>.class);

GenerateTestData.cls included to use this in a flow/process builder, with Generate_Test_data.flow as an example (see picture below for how this could be used). GenerateTestData allows you to just add a text string of the object you intend to create test data for, rather than the full class name e.g. 'Lead' instead of 'List<Account>.class'.

# USE CASES:
- Create x records after declaratively establishing test

# EXAMPLE:
![Example](https://github.com/joshdennis93/MockarooSFDC/blob/master/example.PNG)