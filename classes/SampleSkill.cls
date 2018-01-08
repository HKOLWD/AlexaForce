global class SampleSkill extends alexaforce.AlexaForce {
    //
    // This is the AlexaForce method that must be implemented. 
    // alexaforce.Model.AlexaResponseBody handleRequest(alexaforce.Model.AlexaRequest req)
    // 
    // It will be passed a Request, containing all relevant information from Alexa 
    // For more information, see alexaforce.Model
    // 
    // The method should return the response body of type alexaforce.Model.AlexaResponseBody
    // 
    // The directives and session attributes are added automatically, they should be 
    // managed with respectively AlexaForce.Directives and AlexaForce.SessionData available
    // in the handler
    // 
    // The response can use cards, reprompts, ssml and directives (e.g. Dialog.Delegate)
    // Make sure to manage the alexaforce.Model.AlexaResponseBody.shouldEndSession boolean correctly!
    // 
    // If your skill uses account linking, the logged in user is found in 
    // AlexaForce.authUser. This property will be null in case the user could
    // not be verified (i.e. bad token) or when no account linking has been set up
    global override alexaforce.Model.AlexaResponseBody handleRequest(alexaforce.Model.AlexaRequest req) {
        alexaforce.Model.AlexaResponseBody resp;
        createLog('##In Handler## Received '+req.type, String.valueOf(req));
        if (req.type == 'LaunchRequest') {
            resp = getLaunchRequestResponse(req);
        } else if (req.type == 'IntentRequest') {
            resp = getIntentRequestResponse(req);
        } else if (req.type == 'SessionEndedRequest') {
            resp = getSessionEndedResponse(req);
        } else {
            resp = getDefaultResponse(req);
        }
        createLog('##In Handler## Responding to '+req.type, String.valueOf(resp));
        return resp;
    }
    //
    // Sample launch request that keeps the session open and uses SSML to respond to the skill invocation.
    // This will be fired when alexaforce.Model.AlexaRequest.type = 'LaunchRequest' (i.e. invocation word 
    // was spoken, but did not Alexa recognize an intent from your model
    // Demonstrates use of an alexaforce.Model.AlexaCard and SSML in your response
    private alexaforce.Model.AlexaResponseBody getLaunchRequestResponse(alexaforce.Model.AlexaRequest req) {
        alexaforce.Model.AlexaResponseBody resp =  new alexaforce.Model.AlexaResponseBody();
        resp.outputSpeech = new alexaforce.Model.AlexaSpeechResponse();
        resp.outputSpeech.type = 'SSML';
        resp.outputSpeech.ssml = '<speak><prosody pitch="x-high">Hello there my friend.</prosody></speak>';
        resp.outputSpeech.ssml += '<emphasis level="strong">This is just a sample skill! I can echo your words. Say repeat to have me repeat you.</emphasis></speak>';    
        resp.card = new alexaforce.Model.AlexaCard();
        resp.card.type = 'Simple';
        resp.card.title = 'My Sample AlexaForce Skill';
        resp.card.content = 'This is the Launch Request response of My Sample AlexaForce Skill. I can echo your words. Say repeat to have me repeat you.';
        resp.shouldEndSession = false;            
        return resp;

    }
    //
    // Sample session ended handler. 
    // This will be fired when alexaforce.Model.AlexaRequest.type = 'SessionEndedRequest'
    // Fired in cases of errors (self-inflicted session end) or user commands
    private alexaforce.Model.AlexaResponseBody getSessionEndedResponse(alexaforce.Model.AlexaRequest req) {
        alexaforce.Model.AlexaResponseBody resp =  new alexaforce.Model.AlexaResponseBody();
        resp.outputSpeech = new alexaforce.Model.AlexaSpeechResponse();
        resp.outputSpeech.type = 'PlainText';
        resp.outputSpeech.text = 'Bye!';
        resp.shouldEndSession = true;
        return resp;
    }
    //
    // Sample intent handler. 
    // This will be fired when alexaforce.Model.AlexaRequest.type = 'IntentRequest'
    // Along with the intent, slots will be passed to the skill. They contain
    // the slots from your Alexa model and are contained in a map, as shown in the sample.	
    private alexaforce.Model.AlexaResponseBody getIntentRequestResponse(alexaforce.Model.AlexaRequest req) {
        alexaforce.Model.AlexaResponseBody resp =  new alexaforce.Model.AlexaResponseBody();
    	//
    	// Make sure to gracefully handle all incoming intent types
    	// these are defined in your model. Some are required by Alexa
    	// for example the 3 below
        if(req.intent.name == 'AMAZON.CancelIntent') {
    		//
    		// When the user invokes a cancel-word
    		return getSessionEndedResponse(req);
        }
        if(req.intent.name == 'AMAZON.HelpIntent') {
            //
            // This intent should be handled with a skill explanation
            return getLaunchRequestResponse(req);
        }
        if(req.intent.name == 'AMAZON.StopIntent') {
    		//
    		// When the user invokes a stop-word
    		return getSessionEndedResponse(req);
        }
    	//
    	// Handle the sample skill's EchoIntent
        String replyText;
        if(req.intent.name == 'EchoIntent') {
            //
            // Handle EchoRequest intent, see if we can find an EchoWord slot match
            Map<String, alexaforce.Model.AlexaSlot> matchedSlots = req.intent.slotMap;
            if(matchedSlots.containsKey('EchoWord')) {
            	alexaforce.Model.AlexaSlot slot = matchedSlots.get('EchoWord');    
                replyText = 'Echoing '+slot.value+'.';
                //
                // This sample is not using slot.confirmationStatus, 
                // this could have a value of 'NONE' or 'CONFIRMED'
                // this is useful for models, or specific custom slot
                // types where the confirmation could come from your
                // slot type values defined in the model or Dialog.
            }
        } else {
        	replyText = 'I am not sure what you want. Say repeat to have me repeat a word';   
        }        
        resp.outputSpeech = new alexaforce.Model.AlexaSpeechResponse();
        resp.outputSpeech.type = 'PlainText';
        resp.outputSpeech.text = replyText;
        resp.shouldEndSession = false;
        return resp;
    }
    //
    // The default reponse in case an unsupported Request type is presented by Alexa
    // Uses a card
    private alexaforce.Model.AlexaResponseBody getDefaultResponse(alexaforce.Model.AlexaRequest req) {
        alexaforce.Model.AlexaResponseBody resp =  new alexaforce.Model.AlexaResponseBody();
        resp.outputSpeech = new alexaforce.Model.AlexaSpeechResponse();
        resp.outputSpeech.type = 'PlainText';
        resp.outputSpeech.text = 'This is the default response of My Sample Skill';
        resp.card = new alexaforce.Model.AlexaCard();
        resp.card.type = 'Simple';
        resp.card.title = 'My Sample AlexaForce Skill';
        resp.card.content = 'This is the default response of My Sample AlexaForce Skill';
        resp.shouldEndSession = true;
        return resp;
    }
}