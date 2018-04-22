# Token Provider #
Token Providers may be used in an alexaforce.Alexa_Skill__mdt for the request verification endpoint. Token Providers of type APEX should implement the extend alexaforce.TokenGenerator.

See [alexaforce.TokenGenerator Reference](TokenGenerator.md)

# AlexaForce API Reference #

## Inherited Objects ##

[SessionDataManager Reference](SessionDataManager.md)

[DirectiveManager Reference](DirectiveManager.md)

[SystemInfo Reference](Model/AlexaSystem.md)

[AlexaUserInfo Reference](Model/AlexaUser.md)

[SessionInfo Reference](Model/AlexaSession.md)

[AuthUser Reference](AuthUser.md)

[AlexaSkillConfig Reference](Alexa_Skill__mdt.md)

[PermissionManager Reference](Permissions.md)

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

## Inherited Methods ##
### getFullAddress() ###
[alexaforce.Model.AlexaAddress Reference](Model/AlexaAddress.md)

### getPostalCode() ###
[alexaforce.Model.AlexaAddress Reference](Model/AlexaAddress.md)

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
