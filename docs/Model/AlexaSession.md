# alexaforce.Model.AlexaSession SessionInfo #

Contains an APEX reflection of the Session node of the Alexa request. 
- - - -

**Example:**
```
//
// See example JSON below
System.assertEquals('sample-user-id',SessionInfo.user.userId);
System.assertEquals(true,SessionInfo.new);
System.assertEquals('sample-application-id',SessionInfo.application.applicationId);
```

**Example JSON Request:**
```
"session": {
	"new": true,
	"sessionId": "sample-session-id",
	"application": {
		"applicationId": "sample-application-id"
	},
	"user": {
		"userId": "sample-user-id",
		"permissions": {
			"consentToken": "deprecated-consent-token"
		}
	}
}
```

