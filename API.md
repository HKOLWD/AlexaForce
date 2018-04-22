# AlexaForce API Reference #



## Inherited Properties ##
### SessionDataManager SessionData ###

#### void setSessionAttribute(String key, Object value) ####

Input            | Description
-----------------| ---------------------------------------
key (String)     | Used as index to get and set the value
value (Object)   | The data to hold for this key

**Example:**
```
SessionData.setSessionAttribute('counter', (Integer) 1);
```

#### void removeSessionAttribute(String key) ####
**String key**
The index to be removed from the Session

```
SessionData.removeSessionAttribute('counter');
```

#### Object getSessionAttribute(String key) ####
**String key**
The index to fetch

** returns Object **
Object holds the data fetched for the provided key. Must be casted to the appropriate type

```
Integer counter = (Integer) SessionData.getSessionAttribute('counter');
```

#### Map<String, Object> getSessionAttributes() ####

** returns Map<String, Object> **
Map holds all current session data, indexed by the session keys

```
Map<String, Object> sessionDataMap = SessionData.getSessionAttributes();
System.assert(1, (Integer) sessionDataMap.get('counter'));
```

### DirectiveManager Directives ###

### Model.AlexaSystem SystemInfo ###

### Model.AlexaUser AlexaUserInfo ###

### Model.AlexaSession SessionInfo ###

### AuthUser AuthUser ###

### Alexa_Skill__mdt AlexaSkillConfig ###

### Permissions PermissionManager ###

### String userId ###

### String requestId ###

### String applicationId ###

### Model.AlexaAddress getFullAddress() ###

### Model.AlexaAddress getPostalCode() ###


