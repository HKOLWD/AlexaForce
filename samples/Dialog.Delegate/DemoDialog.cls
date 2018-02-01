global class DemoDialog extends alexaforce.AlexaForce {

    global override alexaforce.Model.AlexaResponseBody handleRequest(alexaforce.Model.AlexaRequest req) {
        createLog('##In Handler## Received '+req.type, String.valueOf(req));
		alexaforce.Model.AlexaResponseBody resp;

        if (req.type == 'IntentRequest') {
            resp = getIntentRequestResponse(req);
        } else 
            resp = getDefaultResponse(req);
        }
        createLog('##In Handler## Responding to '+req.type, String.valueOf(resp));
        return resp;
    }

    private alexaforce.Model.AlexaResponseBody getIntentRequestResponse(alexaforce.Model.AlexaRequest req) {
        alexaforce.Model.AlexaResponseBody resp =  new alexaforce.Model.AlexaResponseBody();
        if(req.intent.name == 'AMAZON.CancelIntent') {
            return getDefaultResponse(req);
        }
        if(req.intent.name == 'AMAZON.HelpIntent') {
            return getDefaultResponse(req);
        }
        if(req.intent.name == 'AMAZON.StopIntent') {
            return getDefaultResponse(req);
        }
        if(req.intent.name == 'ServiceIntent') {

            if(DemoDialogHelper.handleServiceIntentDialog(req, Directives)) {
                createLog('##In Handler## ServiceIntent completed ', String.valueOf(req));

                DemoDialogHelper.logCase(req.intent);
                //
                // Take back control
                resp.outputSpeech = new alexaforce.Model.AlexaSpeechResponse();
                resp.outputSpeech.type = 'PlainText';
                resp.outputSpeech.text = 'I have logged a case for you. Our employees are on it! Bye!';
                resp.card = new alexaforce.Model.AlexaCard();
                resp.card.type = 'Simple';
                resp.card.title = 'Demo Dialog Skill';
                resp.card.content = 'Case logged in Salesforce.';
                resp.shouldEndSession = true;
            }
        } else {
            resp = getDefaultResponse(req); 
        }
        
        return resp;
    }
    private alexaforce.Model.AlexaResponseBody getDefaultResponse(alexaforce.Model.AlexaRequest req) {
        alexaforce.Model.AlexaResponseBody resp =  new alexaforce.Model.AlexaResponseBody();
        resp.outputSpeech = new alexaforce.Model.AlexaSpeechResponse();
        resp.outputSpeech.type = 'PlainText';
        resp.outputSpeech.text = 'This is the default response of My Sample Skill';
        resp.card = new alexaforce.Model.AlexaCard();
        resp.card.type = 'Simple';
        resp.card.title = 'Dialog Demo Skill';
        resp.card.content = 'This is the default response of Dialog Demo Skill';
        resp.shouldEndSession = true;
        return resp;
    }
}