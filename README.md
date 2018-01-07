# AlexaForce
AlexaForce is an Alexa Skill SDK for Salesforce

The skill is available for beta testing by installing the AlexaForce managed package.

For developer orgs: https://login.salesforce.com/packaging/installPackage.apexp?p0=04t0N000000SDvB

For sandbox orgs: https://test.salesforce.com/packaging/installPackage.apexp?p0=04t0N000000SDvB

# Pre-requisites
You will need a Salesforce developer org and an Amazon developer account for this.

To sign up for a Developer org, visit: https://developer.salesforce.com

Get an Amazon dev account here: https://developer.amazon.com

# Setup Instructions
To use AlexaForce, the following steps need to be performed to start building Alexa Skills on Salesforce in no time!

# Step 1: Install the managed package
Log in to your developer or sandbox org and install the package.

For developer orgs: https://login.salesforce.com/packaging/installPackage.apexp?p0=04t0N000000SDvB

For sandbox orgs: https://test.salesforce.com/packaging/installPackage.apexp?p0=04t0N000000SDvB

# Step 2: Configure a Salesforce site
In Salesforce, enter the Setup menu and find the option Build -> Develop -> Sites.

Create a new site and choose the domain name of your liking. Take down the domain name, as you will need it later. It should look something like 
http://your-domain-developer-edition.eu8.force.com/alexa (if you added a default web address suffix 'alexa') or http://your-domain-developer-edition.eu8.force.com/ (if you left the suffix empty)

As the Active Site Home Page, choose the standard Under Construction page.

Once the site has been created, go to the Public Access Settings page. Under Enabled Apex Classes, add alexaforce.Listener.  

# Step 3: Configure a Salesforce site
In Salesforce, enter the Setup menu and find the option Build -> Develop -> Sites.

Create a new site and choose the domain name of your liking. Take down the domain name, as you will need it later. It should look something like 
http://your-domain-developer-edition.eu8.force.com/alexa (if you added a default web address suffix 'alexa') or http://your-domain-developer-edition.eu8.force.com/ (if you left the suffix empty)

As the Active Site Home Page, choose the standard Under Construction page.

Once the site has been created, go to the Public Access Settings page. Under Enabled Apex Classes, add alexaforce.Listener.  

# Step 4: Create an Alexa Skill on Amazon
Here's where all the Alexa magic happens. Log in to your Amazon developer account and find the Alexa Skills option. From your dashboard, go to Alexa -> Alexa Skills Kit. Here, click "Add a new skill". Take down the application id, which you can find in the header, or in the Skill information form. You will need it later.

A skill consists of several parts, Amazon's will guide you through the required steps. Some steps are optional, for example the Certification questions. Although AlexaForce fully supports certification of a skill, this is not required for skills in development or for demo purposes. Other steps are crucial, for example the wake word, and the interaction model. In the git repo you will find the JSON definition of the model that can be used with the provided APEX Sample Skill (AlexaModel.json). The model you create ultimately defines code you need to write to interact with it.

Alexa also allows you to define Dialogs, that allow you to put more of the control of the interaction between Alexa and the user inside the model. For example, you can let the model handle reprompting for required slots and determine completion of an Intent. AlexaForce supports both a Dialog model and a simpler JSON model.

Make sure to fully setup the configuration. Once all checkboxes are lit, you're done. The following parts are required to wire up the Alexa model with your Salesforce skill.

## Define the endpoint
In the "Configuration" section of the Alexa skill, you can use an AWS Lambda endpoint, or in this case HTTPS. Select HTTPS.

As Default endpoint, define your site name (from step 3) and add /services/apexrest/alexaforce/listener at the end. 

E.g. 

http://your-domain-developer-edition.eu8.force.com/alexa/services/apexrest/alexaforce/listener 

http://your-domain-developer-edition.eu8.force.com/services/apexrest/alexaforce/listener

When saving this endpoint, you will need to select the type of certificate that should be used. Select "My development endpoint is a sub-domain of a domain that has a wildcard certificate from a certificate authority" and save.

## Optional: Account linking
It is possible to link Salesforce users (e.g. customer community) to the Alexa skill. This allows for even more control over the output of your skill. Alexa is fully compatible with the Salesforce oauth routines and AlexaForce fully supports authicating users. 

If you set up account linking, make sure to handle the authentication status accordingly in your skill. AlexaForce will provide you with the information about the user and whether authentication succeeded in the first place. 

Make sure to define the userinfo endpoint in your Salesforce custom metadata in step 6. It resides on your main (not the site or community) salesforce domain (must end with salesforce.com!!), suffixed with /services/oauth2/userinfo

# Step 5: Create the APEX class in Salesforce
To implement the handling of the Alexa requests on your Salesforce org, you will need to write an APEX class which extends alexaforce.AlexaForce. You can find an example in the classes folder of this git repo. It includes comments to get you up and running. If you used the model from this git report (AlexaModel.json), the SampleSkill.cls should work instantly.

Go to the Setup menu. Find Build -> Develop -> Apex Classes and create a new Apex Class extending the alexaforce.AlexaForce class.

# Step 6: Activate your skill!
Go to the Custom Metadata Types section of the Setup menu in Salesforce, under Build -> Develop -> Custom Metadata Types. Find the Alexa Skill type and click "Manage records". Create a new Alexa Skill entry for your skill. Use your application id from step 4, and fill in the Apex Class name to match the class from step 5. If you just want to test the example, this should be sufficient. See the screenshot below for an example.

![alt text](https://alexaforce-sdk-dev-ed--c.eu8.content.force.com/servlet/servlet.ImageServer?id=0150N000006TBXz&oid=00D0N000000h00x "Sample Skill")

Enabling Debug Mode will generate log entries per request in the custom object Request_Log__c. Each Request_Log__c has several child Log_Entry__c records containing information about the conversation. In your APEX class you can add logs yourself using the method createLog(String title, String message).

Perform Security Checks is only required when you want to submit your skill for Certification. If you do, be aware that the current security checks are being performed on an unauthenticated Heroku.com endpoint (https://alexa-verifier.herokuapp.com/verify). The endpoint may be suspended at any time and no support is provided. You can host your own verification endpoint though. In this case, implement the checks that are defined here: https://developer.amazon.com/docs/custom-skills/host-a-custom-skill-as-a-web-service.html. Take note that your endpoint does not need to perform the URL testing defined, AlexaForce does this part! If you have your own verification endpoint, set configure the endpoint appropriately in the custom meta data.

An example of the required verification is included in this git repo (alexa-verifier), in Node.js.

# Test!
Your skill should now work. Enable the skill in your companion app. This companion app is also available in your browser, under Alexa -> Alexa Voice Service in the Amazon Developer portal. 

Test your skill using your Echo device, if you have one, or in the browser in the Test section of the skill definition in the Alexa Developer Portal.






