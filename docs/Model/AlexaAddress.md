# alexaforce.Model.AlexaAddress #

Returned from getPostalCode() or getFullAddress(). Only works when the user has given permission. See [PermissionManager Reference](../Permissions.md). Returns ```null``` in case of insufficient permissions, or other errors.

- - - -

**Example:**
```
//
// Properties set when retrieved with getPostalCode()
alexaforce.Model.AlexaAddress.countryCode;
alexaforce.Model.AlexaAddress.postalCode;
//
// Additional properties when retrieved with getFullAddress()
alexaforce.Model.AlexaAddress.addressLine1;
alexaforce.Model.AlexaAddress.addressLine2;
alexaforce.Model.AlexaAddress.addressLine3;
alexaforce.Model.AlexaAddress.city;
alexaforce.Model.AlexaAddress.stateOrRegion;
alexaforce.Model.AlexaAddress.districtOrCounty;

```
