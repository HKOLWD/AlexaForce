# Permissions PermissionManager #

Helper to request permissions (address and list) and check for permissions (device only). 

Checking for list permissions, as well as working with lists should be implemented by the skill developer. Documentation can be found here: https://developer.amazon.com/docs/custom-skills/access-the-alexa-shopping-and-to-do-lists.html


### gotDevicePermission ###
- - - -

``` Boolean gotDevicePermission(String permissionType) ```

Input                    | Description
-------------------------| ---------------------------------------
permissionType (String)  | The device permission to check for. Currently only supports:
                         | read::alexa:device:all:address:country_and_postal_code
                         | read::alexa:device:all:address

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
        }
        return resp;
}		
```

### removeSessionAttribute ###
- - - -

``` void removeSessionAttribute(String key) ```

Input            | Description
-----------------| ---------------------------------------
key (String)     | The index to be removed from the Session

**Example:**
```
SessionData.removeSessionAttribute('counter');
```

### getSessionAttribute ###
- - - -

``` Object getSessionAttribute(String key) ```

Input            | Description
-----------------| ---------------------------------------
key (String)     | The index to fetch


Output           | Description
-----------------| ---------------------------------------
Object	         | Object holds the data fetched for the provided key. Must be casted to the appropriate type

**Example:**
```
Integer counter = (Integer) SessionData.getSessionAttribute('counter');
```

### getSessionAttributes ###
- - - -

``` Map<String, Object> getSessionAttributes() ```

Output               | Description
---------------------| ---------------------------------------
Map<String, Object>	 | Map holds all current session data, indexed by the session keys

**Example:**
```
Map<String, Object> sessionDataMap = SessionData.getSessionAttributes();
System.assertEquals(1, (Integer) sessionDataMap.get('counter'));
```
