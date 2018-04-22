# alexaforce.Model.AlexaUser UserInfo #

Contains an APEX reflection of the User node of the Alexa request. 
- - - -

**Example:**
```
//
// See example JSON below
System.assertEquals('sample-user-id',UserInfo.userId);
```

**Example JSON Request:**
```
"user": {
	"userId": "sample-user-id",
	"permissions": {
		"consentToken": "deprecated-consent-token"
	}
}
```
