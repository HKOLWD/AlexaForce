# alexaforce.Model.AlexaResponseBody #

This is the data type that should be returned by ``` override alexaforce.Model.AlexaResponseBody handleRequest(alexaforce.Model.AlexaRequest req) ```, the main method the developer should implement.
- - - -

**Example:**
```
private alexaforce.Model.AlexaResponseBody getDefaultResponse(alexaforce.Model.AlexaRequest req) {
    alexaforce.Model.AlexaResponseBody resp =  new alexaforce.Model.AlexaResponseBody();
    resp.outputSpeech = new alexaforce.Model.AlexaSpeechResponse();
    resp.outputSpeech.type = 'PlainText';
    resp.outputSpeech.text = 'This is the default response of My Sample Skill';
    resp.card = new alexaforce.Model.AlexaCard();
    resp.card.type = 'Simple';
    resp.card.title = 'My Sample Skill';
    resp.card.content = 'This is the default response of My Sample Skill';
    resp.shouldEndSession = true;
    return resp;
}
```
The following properties are available on the responsebody.

** alexaforce.Model.AlexaSpeechResponse outputSpeech **
Holds the spoken response by Alexa. See [AlexaSpeechResponse Reference](../AlexaSpeechResponse.md)

** alexaforce.Model.AlexaCard card **
Holds a card, which will be sent to the companion app. Can contain several media types.

** alexaforce.Model.AlexaReprompt reprompt **
If the user does not respond, Alexa will send this as a reminder she's waiting for input

** Boolean shouldEndSession **
Manage this boolean carefully. Alexa will need the skill to be re-invoked after ending the session. Session data will be preserved, see [SessionDataManager Reference](SessionDataManager.md)

** alexaforce.Model.AlexaDirective[] directives **
This property should not be used directly. Manage directives with the inherited [DirectiveManager](DirectiveManager.md)


