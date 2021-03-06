
# AlexaForce API Reference #

To implement AlexaForce, the ```handleRequest(Model.AlexaRequest req)``` method must be overriden in a class extending ```alexaforce.AlexaForce```.

Most of the code samples in the docs will assume a context within such an extension.

**Example:**
```
global class DevSkill extends alexaforce.AlexaForce {
    global override alexaforce.Model.AlexaResponseBody handleRequest(alexaforce.Model.AlexaRequest req) {
        alexaforce.Model.AlexaResponseBody resp;
        createLog('##Handler## Request Type', req.type);
        if (req.type == 'LaunchRequest') {
            resp = getLaunchRequestResponse(req);
        } else if (req.type == 'IntentRequest') {
            resp = getIntentRequestResponse(req);
        } else if (req.type == 'SessionEndedRequest') {
            resp = getSessionEndedResponse(req);
        } else {
            resp = getDefaultResponse(req);
        }
        return resp;
    }
}
```
- - - -

## Inherited Objects ##

[SessionDataManager Reference](SessionDataManager.md)

[DirectiveManager Reference](DirectiveManager.md)

[SystemInfo Reference](Model/AlexaSystem.md)

[AlexaUserInfo Reference](Model/AlexaUser.md)

[SessionInfo Reference](Model/AlexaSession.md)

[AuthUser Reference](AuthUser.md)

[AlexaSkillConfig Reference](Alexa_Skill__mdt.md)

[PermissionManager Reference](Permissions.md)

- - - -

## Inherited Primitives ##
### String userId ###
Contains the userId. This value will be uniquely assigned each time the skill is enabled and reset when the skill is disabled. 

**Example:**
```
System.assertEquals('some-user-id',userId);
```

### String requestId ###
The request id from Alexa. Used as a key for alexaforce__Request_Log__c records.

**Example:**
```
System.assertEquals('some-request-id',requestId);
```

### String applicationId ###
The application id which should correspond with a matching alexaforce__Alexa_Skill__mdt.

**Example:**
```
System.assertEquals(AlexaSkillConfig.alexaforce__Application_Id__c, applicationId);
```

- - - -

## Inherited Methods ##
### alexaforce.Model.AlexaAddress getFullAddress() ###
Returns ```null``` in case of insufficient permissions, or other errors. See [PermissionManager Reference](Permissions.md).

Returns an [alexaforce.Model.AlexaAddress](Model/AlexaAddress.md) when successfull.

### alexaforce.Model.AlexaAddress getPostalCode() ###
Returns ```null``` in case of insufficient permissions, or other errors. See [PermissionManager Reference](Permissions.md).

Returns an [alexaforce.Model.AlexaAddress](Model/AlexaAddress.md) when successfull.

### void createLog(String, String) ###
Queues an alexaforce__Log_Entry__c to be inserted after returning the response. Entries will be grouped under the alexaforce__Request_Log__c for the corresponding request id.

``` void createLog(String title, String msg) ```

Input                    | Description
-------------------------| -----------------------------------------
title (String)           | Used as name for the log entry
msg (String)             | Used as the Message__c for the log entry

**Example:**
```
createLog('##In My Custom Skill##', 'My message');
```

- - - -

# Token Provider #

Token Providers may be used in an alexaforce.Alexa_Skill__mdt for the request verification endpoint. Token Providers of type APEX should implement alexaforce.TokenGenerator.

See [alexaforce.TokenGenerator Reference](TokenGenerator.md)

