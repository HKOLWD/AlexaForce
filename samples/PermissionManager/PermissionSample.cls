//
// This skill will try to read up the device city address in the LaunchRequest. 
// If no permission was yet given, it will ask for permission to read the full address.
global class PermissionSample extends AlexaForce {
    global override alexaforce.Model.AlexaResponseBody handleRequest(alexaforce.Model.AlexaRequest req) {
        alexaforce.Model.AlexaResponseBody resp;
        if (req.type == 'LaunchRequest') {
            resp = getLaunchRequestResponse(req);
        } else if (req.type == 'IntentRequest') {
            resp = getDefaultResponse(req);
        } else if (req.type == 'SessionEndedRequest') {
            resp = getDefaultResponse(req);
        } else {
            resp = getDefaultResponse(req);
        }
        return resp;
    }

    private alexaforce.Model.AlexaResponseBody getLaunchRequestResponse(alexaforce.Model.AlexaRequest req) {
        alexaforce.Model.AlexaResponseBody resp =  new alexaforce.Model.AlexaResponseBody();
        String permType = 'read::alexa:device:all:address';
        try {
            if (PermissionManager.gotDevicePermission(permType)) {
                alexaforce.Model.AlexaAddress address = getFullAddress();
                resp.outputSpeech = new alexaforce.Model.AlexaSpeechResponse();
                resp.outputSpeech.type = 'PlainText';
                resp.outputSpeech.text = 'YES I GOT PERMISSION!';
                if(address <> null && address.city <> null) {
                    resp.outputSpeech.text += 'Your address is '+address.city;
                } else {
                    resp.outputSpeech.text += 'You have not set up a city address.';
                }

                resp.shouldEndSession = true;

            } else {
                resp = PermissionManager.askPermission('I need permission!', permType);
                resp.shouldEndSession = true;
            }
        }
        catch (Exception e) {
            createLog('## PermissionSample ### Exception',e.getMessage()+' '+e.getStackTraceString());
        }
        return resp;
    }

    private alexaforce.Model.AlexaResponseBody getDefaultResponse(alexaforce.Model.AlexaRequest req) {
        alexaforce.Model.AlexaResponseBody resp =  new alexaforce.Model.AlexaResponseBody();
        resp.outputSpeech = new alexaforce.Model.AlexaSpeechResponse();
        resp.outputSpeech.type = 'PlainText';
        resp.outputSpeech.text = 'This is the default response of PermissionSample';
        resp.card = new alexaforce.Model.AlexaCard();
        resp.card.type = 'Simple';
        resp.card.title = 'PermissionSample Skill';
        resp.card.content = 'This is the default response of PermissionSample';
        resp.shouldEndSession = true;
        return resp;
    }
}