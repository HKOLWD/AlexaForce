# SessionDataManager SessionData #

Used to set and retrieve custom session data. This is useful for retaining information between requests.

### setSessionAttribute ###
- - - -
Sets the value for a certain session attribute

``` void setSessionAttribute(String key, Object value) ```

Input            | Description
-----------------| ---------------------------------------
key (String)     | Used as index to get and set the value
value (Object)   | The data to hold for this key

**Example:**
```
SessionData.setSessionAttribute('counter', (Integer) 1);
```

### removeSessionAttribute ###
- - - -
Deletes the session attribute from the next response

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
Returns the session value for the specified key

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
Returns a map of all current session attributes and their values.

``` Map<String, Object> getSessionAttributes() ```

Output               | Description
---------------------| ---------------------------------------
Map<String, Object>	 | Map holds all current session data, indexed by the session keys

**Example:**
```
Map<String, Object> sessionDataMap = SessionData.getSessionAttributes();
System.assertEquals(1, (Integer) sessionDataMap.get('counter'));
```
