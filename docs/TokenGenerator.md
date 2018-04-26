# TokenGenerator #
An alexaforce__Token_Provider__mdt of type alexaforce__APEX_Token_Generator__c should be implemented as shown in the sample below. The resulting string will be used as a Bearer Authorization header.

**Example:**
```
public class DevToken extends alexaforce.TokenGenerator {
    public override String generateToken() {
        return 'dummy token';
    }
}
```

![picture alt](http://www.gaonline.nl/alexaforce/TokenProvider-Sample.png "Example custom meta data")
