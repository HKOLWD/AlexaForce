# alexaforce.AuthUser AuthUser #

Contains the openid information of the user that has authenticated through account linking with Alexa. Will contain the Salesforce User Id in user_id when authentication has been set up for Salesforce.

The value will be ```null``` when no account linking has been set up, or authentication failed.

- - - -

**Example:**
```
//
// See example openid JSON below formmore properties
System.assertEquals('sample-user-id',AuthUser.user_id);
System.assertEquals(1,[SELECT count() FROM User WHERE Id = :AuthUser.user_id]]);
System.assertEquals('john.doe@example.com',AuthUser.email);
```

**Example openid JSON response:**
```
{
  "zoneinfo": "Europe\/Amsterdam",
  "utcOffset": 3600000,
  "user_type": "CSP_LITE_PORTAL",
  "user_id": "sample-user-id",
  "urls": {
    "users": "https:\/\/my-dev-ed.my.salesforce.com\/services\/data\/v{version}\/chatter\/users",
    "tooling_soap": "https:\/\/my-dev-ed.my.salesforce.com\/services\/Soap\/T\/{version}\/some-id",
    "tooling_rest": "https:\/\/my-dev-ed.my.salesforce.com\/services\/data\/v{version}\/tooling\/",
    "sobjects": "https:\/\/my-dev-ed.my.salesforce.com\/services\/data\/v{version}\/sobjects\/",
    "search": "https:\/\/my-dev-ed.my.salesforce.com\/services\/data\/v{version}\/search\/",
    "rest": "https:\/\/my-dev-ed.my.salesforce.com\/services\/data\/v{version}\/",
    "recent": "https:\/\/my-dev-ed.my.salesforce.com\/services\/data\/v{version}\/recent\/",
    "query": "https:\/\/my-dev-ed.my.salesforce.com\/services\/data\/v{version}\/query\/",
    "profile": "https:\/\/my-dev-ed.my.salesforce.com\/some-id",
    "partner": "https:\/\/my-dev-ed.my.salesforce.com\/services\/Soap\/u\/{version}\/some-id",
    "metadata": "https:\/\/my-dev-ed.my.salesforce.com\/services\/Soap\/m\/{version}\/some-id",
    "groups": "https:\/\/my-dev-ed.my.salesforce.com\/services\/data\/v{version}\/chatter\/groups",
    "feeds": "https:\/\/my-dev-ed.my.salesforce.com\/services\/data\/v{version}\/chatter\/feeds",
    "feed_items": "https:\/\/my-dev-ed.my.salesforce.com\/services\/data\/v{version}\/chatter\/feed-items",
    "feed_elements": "https:\/\/my-dev-ed.my.salesforce.com\/services\/data\/v{version}\/chatter\/feed-elements",
    "enterprise": "https:\/\/my-dev-ed.my.salesforce.com\/services\/Soap\/c\/{version}\/some-id",
    "custom_domain": "https:\/\/my-dev-ed.my.salesforce.com"
  },
  "updated_at": "2018-02-19T13:31:07.000Z",
  "sub": "https:\/\/login.salesforce.com\/id\/some-id\/some-id",
  "profile": "https:\/\/my-dev-ed.my.salesforce.com\/some-id",
  "preferred_username": "john.doe@example.com",
  "picture": "https:\/\/my-dev-ed.my.salesforce.com\/img\/userprofile\/default_profile_200_v2.png",
  "photos": {
    "thumbnail": "https:\/\/my-dev-ed.my.salesforce.com\/img\/userprofile\/default_profile_45_v2.png",
    "picture": "https:\/\/my-dev-ed.my.salesforce.com\/img\/userprofile\/default_profile_200_v2.png"
  },
  "organization_id": "some-org-id",
  "nickname": "John",
  "name": "John Doe",
  "language": "nl_NL",
  "is_app_installed": true,
  "given_name": "John",
  "family_name": "Doe",
  "email_verified": true,
  "email": "john.doe@example.com",
  "active": true
}```

