# AlexaForce Release Notes #

## May 2018 ##
* Documentation improved and [moved to md-files on Github](README.md)
* Added missing text node to alexaforce.Model.AlexaCard.
* New property in model: alexaForce.Model.AlexaAddress.
* AlexaForce properties restructured. Opened up SystemInfo (of type alexaforce.Model.AlexaSystem) property, that contains most of the contextual data, including tokens for the developer to use when making e.g. list requests and information about the device, user and application. Also added AlexaUserInfo (redundant from the SystemInfo), containing the user as known to Alexa, and SessionInfo, containing session information (not custom session data, this is found in SessionData).
* AlexaForce now also supports out-of-session requests, where context is taken from the System node
* New inherited methods: ``` alexaforce.Model.AlexaAddress getFullAddress() ``` and ``` alexaforce.Model.AlexaAddress getPostalCode() ```. Returns an [alexaforce.Model.AlexaAddress](Model/AlexaAddress.md) when successfull.
* Added a permission manager that can request all permissions (by adding a card to the response) and check for permissions for the device address functions. List permissions should be managed by the developer. See [PermissionManager Reference](../Permissions.md).
* Added some additional logging to AlexaForce
* Added custom meta data type alexaforce.Token_Provider__mdt. Token providers allow the developer to specify a fixed or APEX generated token entry, which can be used to configure the verification endpoint in alexaforce.Alexa_Skill__mdt.alexaforce__Verify_Token_Provider__c. See [Token Provider Documentation](TokenGenerator.md)
