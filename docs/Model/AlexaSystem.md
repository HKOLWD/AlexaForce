# alexaforce.Model.AlexaSystem SystemInfo #

Contains an APEX reflection of the System node of the Alexa request. 
- - - -

**Example:**
```
//
// See example JSON below
System.assertEquals('sample-application-id',SystemInfo.application.applicationId);
System.assertEquals('sample-user-id',SystemInfo.user.userId);
System.assertEquals('sample-device-id',SystemInfo.device.deviceId);
System.assertEquals('https://api.amazonalexa.com',SystemInfo.apiEndpoint);
System.assertEquals('sample-bearer-token',SystemInfo.apiAccessToken);
```

**Example JSON Request:**
```
"System": {
	"application": {
		"applicationId": "sample-application-id"
	},
	"user": {
		"userId": "sample-user-id",
		"permissions": {
			"consentToken": "deprecated-consent-token"
		}
	},
	"device": {
		"deviceId": "sample-device-id",
		"supportedInterfaces": {
			"AudioPlayer": {},
			"Display": {
				"templateVersion": "1.0",
				"markupVersion": "1.0"
			}
		}
	},
	"apiEndpoint": "https://api.amazonalexa.com",
	"apiAccessToken": "sample-bearer-token"
}
```
