# Permissions PermissionManager #

Helper to request permissions (address and list) and check for permissions (device only). 

Checking for list permissions, as well as working with lists should be implemented by the skill developer. Documentation can be found here: https://developer.amazon.com/docs/custom-skills/access-the-alexa-shopping-and-to-do-lists.html


### gotDevicePermission ###
- - - -
Returns true if the requested permision has been granted by the user.

Supports:

* read::alexa:device:all:address:country_and_postal_code 
* read::alexa:device:all:address

``` Boolean gotDevicePermission(String permissionType) ```

Input                    | Description
-------------------------| ---------------------------------------
permissionType (String)  | The device permission to check for

**Example:**
```
    private Model.AlexaResponseBody getResponse(Model.AlexaRequest req) {
        Model.AlexaResponseBody resp =  new Model.AlexaResponseBody();
        String permType = 'read::alexa:device:all:address';
        try {
            if(PermissionManager.gotDevicePermission(permType)) {
                Model.AlexaAddress address = getFullAddress();
                resp.outputSpeech = new Model.AlexaSpeechResponse();
                resp.outputSpeech.type = 'PlainText';
                resp.outputSpeech.text = 'Yes, I have permission!';
                if(address <> null && address.city <> null) {
                    resp.outputSpeech.text += 'Your address is '+address.city;
                } else {
                    resp.outputSpeech.text += 'You have not set up a city address.';
                }

                resp.shouldEndSession = true;

            } else {
                resp = PermissionManager.askPermission('I need permission!', permType);
                resp.shouldEndSession = true;
            }
        }
        catch (Exception e) {
            createLog('## My Skill ### Exception',e.getMessage()+' '+e.getStackTraceString());
            return resp;
        }
        return resp;
}		
```

### askPermission ###
- - - -
Returns a alexaforce.Model.AlexaResponseBody containing a card requesting the indicated permissions and the spoken text. The outputSpeech property can be modified by implementation (e.g. for SSML), the card should remain in tact.

``` 
alexaforce.Model.AlexaResponseBody askPermission(String spokenText, String permissionType) 
alexaforce.Model.AlexaResponseBody askPermission(String spokenText, List<String> permissionTypes)
```

Input                            | Description
-------------------------------- | ---------------------------------------------------------
spokenText (String)              | What Alexa will say when sending the permission request
permissionType (String)          | Request a single permission
permissionTypes (Set<String>)    | Request multiple permissions

Output                           | Description
-------------------------------- | --------------------------------------------------------------------------------------------
Model.AlexaResponseBody          | ResponseBody contains permission card and spoken text. 

**Example:**
```
Set<String> permTypes = new Set<String> {'read::alexa:device:all:address','read::alexa:device:all:address:country_and_postal_code','read::alexa:household:list','write::alexa:household:list'};
alexaforce.Model.AlexaResponseBody resp = PermissionManager.askPermission('I need permission!', permTypes[0]);
alexaforce.Model.AlexaResponseBody resp = PermissionManager.askPermission('I need permissions!', permTypes);
```
