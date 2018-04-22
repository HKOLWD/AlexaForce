# alexaforce.Model.AlexaAddress #

Returned from getPostalCode() or getFullAddress(). Only works when the user has given permission. See [PermissionManager Reference](../Permissions.md). Returns ```null``` in case of insufficient permissions, or other errors.

- - - -

**Example:**
```
//
// Properties set when retrieved with getPostalCode()
global String countryCode;
global String postalCode;
//
// Additional properties when retrieved with getFullAddress()
global String addressLine1;
global String addressLine2;
global String addressLine3;
global String city;
global String stateOrRegion;
global String districtOrCounty;

```
