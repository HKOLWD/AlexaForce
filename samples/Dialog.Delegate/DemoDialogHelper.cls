global class DemoDialogHelper {
	public static Boolean handleServiceIntentDialog(alexaforce.Model.AlexaRequest req, alexaforce.DirectiveManager dirManager) {
        //
        // Returns false while the Dialog is not yet marked completed by Alexa,
        // Sets Dialog.Delegate while Alexa is questioning the user
        Boolean resp;
        Map<String, alexaforce.Model.AlexaSlot> matchedSlots = req.intent.slotMap;
        if(req.dialogState == 'STARTED') {
            alexaforce.Model.AlexaDirective dir = new alexaforce.Model.AlexaDirective();
            dir.type = 'Dialog.Delegate';
            dirManager.setDirective(dir);
            resp = false;
        } else if(req.dialogState != 'COMPLETED') {
            alexaforce.Model.AlexaDirective dir = new alexaforce.Model.AlexaDirective();
            dir.type = 'Dialog.Delegate';
            dirManager.setDirective(dir);
            resp = false;             
        } else {
            resp = true;
        }
        return resp;
    }

    public static void logCase(alexaforce.Model.AlexaRequestIntent intent) {
        Case c = new Case();
        c.Name = intent.name;
        c.Description = intent.slotMap.get('IssueDescription').value;
        c.Type = intent.slotMap.get('ServiceTopic').value;
        insert c;
    }    
}