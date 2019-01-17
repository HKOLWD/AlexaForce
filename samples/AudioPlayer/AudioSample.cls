global class AudioSample extends alexaforce.AlexaForce {
    global override alexaforce.Model.AlexaResponseBody handleRequest(alexaforce.Model.AlexaRequest req) {
        alexaforce.Model.AlexaResponseBody resp;
        createLog('##In Handler## Received '+req.type, JSON.serializePretty(req));
        if (req.type == 'LaunchRequest') {
            resp = getLaunchRequestResponse(req);
        } else if (req.type == 'IntentRequest') {
            resp = getIntentRequestResponse(req);
        } else if (req.type == 'SessionEndedRequest') {
            resp = getSessionEndedResponse(req);
        } else if(req.type == 'AudioPlayer.PlaybackStarted'){
            resp = getPlaybackStartedResponse(req);
        }  else if(req.type == 'AudioPlayer.PlaybackFinished') {
            resp = getPlaybackFinishedResponse(req);
        } else if(req.type == 'AudioPlayer.PlaybackStopped') {
            resp = getPlaybackFinishedResponse(req);
        } else if(req.type == 'AudioPlayer.PlaybackNearlyFinished') {
            resp = getPlaybackNearlyFinishedResponse(req);
        }   else {
            resp = getDefaultResponse(req);
        }
        createLog('##In Handler## Responding to '+req.type, JSON.serializePretty(resp));
        return resp;
    }
    private alexaforce.Model.AlexaResponseBody getLaunchRequestResponse(alexaforce.Model.AlexaRequest req) {
        alexaforce.Model.AlexaResponseBody resp =  new alexaforce.Model.AlexaResponseBody();
        resp.outputSpeech = new alexaforce.Model.AlexaSpeechResponse();
        resp.outputSpeech.type = 'SSML';
        resp.outputSpeech.ssml = '<speak>';
        resp.outputSpeech.ssml += 'Playing the award winning T.P.O. podcast';
        resp.outputSpeech.ssml += '</speak>';
        resp.card = new alexaforce.Model.AlexaCard();
        resp.card.type = 'Standard';
        resp.card.title = 'TPO Podcast';
        resp.card.content = 'Playing TPO podcast, with Roderick Veelo and Bert Brussen';
        resp.card.image = new alexaforce.Model.AlexaImage();
        resp.card.image.smallImageUrl = 'https://tpo.nl/wp-content/uploads/2018/09/podcast3.png';
        resp.card.image.largeImageUrl = 'https://tpo.nl/wp-content/uploads/2018/09/podcast3.png';
        resp.shouldEndSession = true;

        alexaforce.Model.AlexaDirective dir = new alexaforce.Model.AlexaDirective();
        dir.type = 'AudioPlayer.Play';
        dir.playBehavior = 'REPLACE_ALL';
        dir.audioItem = new alexaforce.Model.AlexaAudioItem();
        dir.audioItem.stream = new alexaforce.Model.AlexaStream();
        dir.audioItem.stream.url = 'https://tpo.nl/wp-content/uploads/2019/01/TPO-podcast-101-1.mp3'; // Hard-coded episode
        dir.audioItem.stream.streamFormat ='AUDIO_MP3';
        dir.audioItem.stream.token = 'tpo101';
        dir.audioItem.metadata = new alexaforce.Model.AlexaMetaData();
        dir.audioItem.metadata.title = 'TPO Podcast';
        dir.audioItem.metadata.subtitle = 'The award winning podcast, with Roderick Veelo and Bert Brussen.';

        Directives.setDirective(dir);
        return resp;
    }

    private alexaforce.Model.AlexaResponseBody getPlaybackStartedResponse(alexaforce.Model.AlexaRequest req) {
        alexaforce.Model.AlexaResponseBody resp =  new alexaforce.Model.AlexaResponseBody();
        resp.shouldEndSession = true;
        return resp;
    }
    private alexaforce.Model.AlexaResponseBody getPlaybackNearlyFinishedResponse(alexaforce.Model.AlexaRequest req) {
        alexaforce.Model.AlexaResponseBody resp =  new alexaforce.Model.AlexaResponseBody();
        resp.shouldEndSession = true;
        return resp;
    }
    private alexaforce.Model.AlexaResponseBody getPlaybackFinishedResponse(alexaforce.Model.AlexaRequest req) {
        alexaforce.Model.AlexaResponseBody resp =  new alexaforce.Model.AlexaResponseBody();
        resp.shouldEndSession = true;
        alexaforce.Model.AlexaDirective dir = new alexaforce.Model.AlexaDirective();
        dir.type = 'AudioPlayer.Stop';
        Directives.setDirective(dir);
        return resp;
    }
    //
    // Sample session ended handler.
    // This will be fired when alexaforce.Model.AlexaRequest.type = 'SessionEndedRequest'
    // Fired in cases of errors (self-inflicted session end) or user commands
    private alexaforce.Model.AlexaResponseBody getSessionEndedResponse(alexaforce.Model.AlexaRequest req) {
        alexaforce.Model.AlexaResponseBody resp =  new alexaforce.Model.AlexaResponseBody();
        resp.outputSpeech.type = 'PlainText';
        resp.outputSpeech.text = 'Bye!';
        resp.shouldEndSession = true;
        return resp;
    }
    private alexaforce.Model.AlexaResponseBody getIntentRequestResponse(alexaforce.Model.AlexaRequest req) {
        alexaforce.Model.AlexaResponseBody resp =  new alexaforce.Model.AlexaResponseBody();
        //
        // Make sure to gracefully handle all incoming intent types
        // these are defined in your model. Some are required by Alexa
        // for example the 3 below
        if(req.intent.name == 'AMAZON.CancelIntent') {
            //
            // When the user invokes a cancel-word
            return getPlaybackFinishedResponse(req);
        }
        if(req.intent.name == 'AMAZON.HelpIntent') {
            //
            // This intent should be handled with a skill explanation
            return getLaunchRequestResponse(req);
        }
        if(req.intent.name == 'AMAZON.StopIntent') {
            //
            // When the user invokes a stop-word
            return getPlaybackFinishedResponse(req);
        }
        if(req.intent.name == 'AMAZON.PauseIntent') {
            //
            // When the user invokes a stop-word
            return getPlaybackFinishedResponse(req);
        }
        if(req.intent.name == 'AMAZON.ResumeIntent') {
            Long offset = context.AudioPlayer.offsetInMilliseconds;
            alexaforce.Model.AlexaDirective dir = new alexaforce.Model.AlexaDirective();
            dir.type = 'AudioPlayer.Play';
            dir.playBehavior = 'REPLACE_ALL';
            dir.audioItem = new alexaforce.Model.AlexaAudioItem();
            dir.audioItem.stream = new alexaforce.Model.AlexaStream();
            dir.audioItem.stream.url = 'https://tpo.nl/wp-content/uploads/2019/01/TPO-podcast-101-1.mp3';
            dir.audioItem.stream.streamFormat ='AUDIO_MP3';
            dir.audioItem.stream.token = 'tpo94';
            dir.audioItem.stream.offsetInMilliseconds = offset;
            Directives.setDirective(dir);
        }
        /*
        Audio intent types
            AMAZON.CancelIntent
            AMAZON.LoopOffIntent
            AMAZON.LoopOnIntent
            AMAZON.NextIntent
            AMAZON.PauseIntent
            AMAZON.PreviousIntent
            AMAZON.RepeatIntent
            AMAZON.ResumeIntent
            AMAZON.ShuffleOffIntent
            AMAZON.ShuffleOnIntent
            AMAZON.StartOverIntent
        */

        resp.shouldEndSession = true;
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