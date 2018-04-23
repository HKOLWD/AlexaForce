# alexaforce.Model.AlexaAddress #

Returned from ```alexaforce.AlexaForce.getPostalCode()``` or ```alexaforce.AlexaForce.getFullAddress()```. Returns ```null``` in case of insufficient permissions, or other errors. See [PermissionManager Reference](../Permissions.md).

- - - -

```
alexaforce.Model.AlexaAddress getFullAddress()
alexaforce.Model.AlexaAddress getPostalCode()
```

**Example:**
```
//
// Properties set when retrieved with getPostalCode()
// alexaforce.Model.AlexaAddress.countryCode;
// alexaforce.Model.AlexaAddress.postalCode;
//
// Additional properties when retrieved with getFullAddress()
// alexaforce.Model.AlexaAddress.addressLine1;
// alexaforce.Model.AlexaAddress.addressLine2;
// alexaforce.Model.AlexaAddress.addressLine3;
// alexaforce.Model.AlexaAddress.city;
// alexaforce.Model.AlexaAddress.stateOrRegion;
// alexaforce.Model.AlexaAddress.districtOrCounty;

alexaforce.Model.AlexaAddress pcAddress = getPostalCode();
System.assertEquals('Device-PC', pcAddress.postalCode);
System.assertEquals(null, pcAddress.city);

alexaforce.Model.AlexaAddress fullAddress = getFullAddress();
System.assertEquals('Device-PC', fullAddress.postalCode);
System.assertEquals('Device-City-Address', fullAddress.city);

```
