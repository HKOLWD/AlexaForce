# alexaforce.Model.AlexaContext context #

Contains an APEX reflection of the context node of the Alexa request. Needed for Audio skills.
- - - -

**Example:**
```
//
// See example JSON below
System.assertEquals(5454,context.AudioPlayer.offsetInMilliseconds);

```

**Example JSON Request:**
```
"context": {
    "System_x": {
      "apiAccessToken": "some-token",
      "apiEndpoint": "https:\/\/api.amazonalexa.com",
      "device": {
        "supportedInterfaces": {
          "Geolocation": {
            
          },
          "AudioPlayer": {
            
          }
        },
        "deviceId": "some-device-id"
      },
      "user": {
        "userId": "some-user-id"
      },
      "application": {
        "applicationId": "some-application-id"
      }
    },
    "AudioPlayer": {
      "playerActivity": "STOPPED",
      "token": "some-token",
      "offsetInMilliseconds": 5454
    }
  }```

