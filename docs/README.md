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

### String requestId ###
The request id from Alexa. Used as a key for alexaforce.Request_Log__c records.

### String applicationId ###
The application id which should correspond with a matching Alexa_Skill__mdt.

## Inherited Methods ##
### Model.AlexaAddress getFullAddress() ###
[Model.AlexaAddress Reference](Model/AlexaAddress.md)

### Model.AlexaAddress getPostalCode() ###
[Model.AlexaAddress Reference](Model/AlexaAddress.md)

### void createLog(String title, String msg) ###
Queues an alexaforce.Log_Entry__c to be inserted after returning the response. Entries will be grouped under the alexaforce.Request_Log__c for the corresponding request id.
