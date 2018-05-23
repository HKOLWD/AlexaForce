# AlexaForce
AlexaForce is an Alexa Skill SDK for Salesforce. 

Alexa is the sweet voiced AI assistant (https://www.youtube.com/watch?v=r5p0gqCIEa8) of Amazon.

Salesforce is the world's leading cloud platform provider (https://developer.salesforce.com/). 

Currently, all Alexa skill implementations that integrate with Salesforce, require an external (from a Salesforce perspective) endpoint to host the skill and a "foreign" programming language to implement (e.g. using the Java and Node.jks SDK's). The consequence is a lot of API back and forth to deal with Salesforce operations. 

Not anymore. AlexaForce let's you define Alexa Skills, straight on your Salesforce.com org, using APEX!

The AlexaForce SDK is available for beta testing by installing the managed package.

# Update 25 April 2018
New beta version of the managed package has been released, *May 2018*. 

The new versions are found here:

For developer orgs: https://login.salesforce.com/packaging/installPackage.apexp?p0=04t0N0000010j6b

For sandbox orgs: https://login.salesforce.com/packaging/installPackage.apexp?p0=04t0N0000010j6b

It contains several fixes and adds several new features. You can find them in the [AlexaForce May 2018 Release Notes](docs/RELEASENOTES.md) 

# Pre-requisites
You will need a Salesforce developer org and an Amazon developer account for this.

To sign up for a Developer org, visit: https://developer.salesforce.com

Get an Amazon dev account here: https://developer.amazon.com

# Setup Instructions
To use AlexaForce, the following steps need to be performed to start building Alexa Skills on Salesforce in no time! 

Once you have performed these steps, any new skills you create on the same Salesforce org, only require you to repeat steps 3, 4 and 5.

# Step 1: Install the managed package
Log in to your developer or sandbox org and install the package.

For developer orgs: https://login.salesforce.com/packaging/installPackage.apexp?p0=04t0N0000010j6b

For sandbox orgs: https://login.salesforce.com/packaging/installPackage.apexp?p0=04t0N0000010j6b

# Step 2: Configure a Salesforce site
In Salesforce, enter the Setup menu and find the option Build -> Develop -> Sites.

Create a new site and choose the domain name of your liking. Take down the domain name, as you will need it later. It should look something like 
http://your-domain-developer-edition.eu8.force.com/alexa (if you added a default web address suffix 'alexa') or http://your-domain-developer-edition.eu8.force.com/ (if you left the suffix empty)

As the Active Site Home Page, choose the standard "Under Construction" page.

Once the site has been created, go to the Public Access Settings page. Under Enabled Apex Classes, add alexaforce.Listener. 

Make sure to activate the site.

# Step 3: Create an Alexa Skill on Amazon
Here's where all the Alexa magic happens. Log in to your Amazon developer account and find the Alexa Skills option. From your dashboard, go to Alexa -> Alexa Skills Kit. Here, click "Add a new skill". Take down the application id, which you can find in the header, or in the Skill information form. You will need it later.

A skill definition consists of several parts. Amazon will guide you through the required steps. Once all the checkboxes are lit, you're done. 

Some steps are optional, for example the certification questions. Although AlexaForce supports certification, this is not required for skills in development or for demo purposes. 

Some of the other steps are crucial, for example the wake word (what word does the user say to activate your skill?), and the interaction model (what kind of input does your skill require and what user intents (e.g. look up a record, or create a Case in Salesforce) is your skill looking for)? The more complex the model, the more elaborate your APEX handler should be. A lot of the handling can be outsourced to Amazon though, if you use a Dialog model.

Dialogs put more of the control of the interaction between Alexa and the user inside the model, and therefore generally require less APEX code. For example, you can let the model handle reprompting for required slots and determine completion of an Intent. AlexaForce supports both a Dialog model (using Directives) and a simpler JSON model (like the SampleSkill).

The following parts are required to wire up the Alexa model with your Salesforce skill.

## Define the endpoint
In the "Configuration" section of the Alexa skill, you can use an AWS Lambda endpoint, or in this case HTTPS. Select HTTPS.

As Default endpoint, define your site name (from step 2) and add /services/apexrest/alexaforce/listener at the end. 

E.g. 

http://your-domain-developer-edition.eu8.force.com/alexa/services/apexrest/alexaforce/listener 

http://your-domain-developer-edition.eu8.force.com/services/apexrest/alexaforce/listener

When saving this endpoint, you will need to select the type of certificate that should be used. Select "My development endpoint is a sub-domain of a domain that has a wildcard certificate from a certificate authority" and save.

## Optional: Account linking
It is possible to link Salesforce users (e.g. customer community) to the Alexa skill. This allows for even more control over the output of your skill. Alexa is compatible with the Salesforce oauth routines and AlexaForce supports authicating users. 

If you set up account linking, make sure to handle the authentication status accordingly in your skill. AlexaForce will provide you with the information about the user and whether authentication succeeded in the first place. 

Make sure to define the userinfo endpoint in your Salesforce custom metadata in step 5. It resides on your main (not the site or community) salesforce domain (must end with salesforce.com!!), suffixed with /services/oauth2/userinfo.

Add this endpoint as a remote site at Administer -> Security Controls -> Remote Site Settings!

A trailhead is available with instructions how to link Alexa to Salesforce: https://trailhead.salesforce.com/en/projects/build-a-private-alexa-for-business-skill-for-salesforce/steps/create-a-connected-app-and-link-to-alexa

# Step 4: Create the APEX class in Salesforce
To implement the handling of the Alexa requests on your Salesforce org, you will need to write an APEX class which extends alexaforce.AlexaForce. 

You can find a basic example here: [Basic APEX Sample Code](samples/basic). It includes comments to get you up and running. If you use the [model from the basic example](samples/AlexaModel.json), the SampleSkill.cls should work instantly. For an overview of all sample code, go to [Code Samples](samples/). 

Go to the Setup menu. Find Build -> Develop -> Apex Classes and create a new Apex Class extending the alexaforce.AlexaForce class.

# Step 5: Activate your skill!
Go to the Custom Metadata Types section of the Setup menu in Salesforce, under Build -> Develop -> Custom Metadata Types. Find the Alexa Skill type and click "Manage records". Create a new Alexa Skill entry for your skill. Use your application id from step 3, and fill in the Apex Class name to match the class from step 4. If you just want to test the example, this should be sufficient. See the screenshot below for an example.

![alt text](https://alexaforce-sdk-dev-ed--c.eu8.content.force.com/servlet/servlet.ImageServer?id=0150N000006TBXz&oid=00D0N000000h00x "Sample Skill")

Enabling ***Debug Mode*** will generate log entries per request in the custom object Request_Log__c. Each Request_Log__c has several child Log_Entry__c records containing information about the conversation. In your APEX class you can add logs yourself using the method createLog(String title, String message). Debug Mode must be enabled for createLog(String title, String msg) to actually output something!

![alt text](https://alexaforce-sdk-dev-ed--c.eu8.content.force.com/servlet/servlet.ImageServer?id=0150N000006UY6m&oid=00D0N000000h00x "Request Logs")

***Perform Security Checks*** is only required when you want to submit your skill for Certification. If you do, be aware that the current security checks are being performed on an unauthenticated Heroku.com endpoint (https://alexa-verifier.herokuapp.com/verify). The endpoint may be suspended at any time and no support is provided. You will have to take my word it's not storing any of the data passed to it. Unfortunately, Salesforce does not appear to be able to validate the certificate using APEX.

The good news is: You can host your own verification endpoint! To do so, you will need to implement the checks that are defined here: https://developer.amazon.com/docs/custom-skills/host-a-custom-skill-as-a-web-service.html. Take note that your endpoint does not need to perform the URL testing defined (port, path, host), AlexaForce does this part! 

If you have your own verification endpoint, configure the endpoint appropriately in the custom meta data entry. You must also add this endpoint in Salesforce as a Remote Site in the Setup menu, at Administer -> Security Controls -> Remote Site Settings. An example of the required verification REST service is included in this git repo (alexa-verifier), in Node.js. 

AlexaForce supports authentication with a fixed or generated (by APEX) Bearer token, sent to the verification service as Authorization header. For more information, see the [Token Provider Documentation](docs/TokenGenerator.md). After setting up the token, make sure to configure it in your alexaforce.Alexa_Skill__mdt

# Test!
Your skill should now work. Enable the skill in your companion app. This companion app is also available in your browser, under Alexa -> Alexa Voice Service in the Amazon Developer portal. 

Test your skill using your Echo device, if you have one, or in the browser in the Test section of the skill definition in the Alexa Developer Portal. Another possibility is to test using https://echosim.io

Modify the APEX code and Alexa should immediately produce the changed response. 

# AlexaForce APEX API Reference
The documentation has been updated and can now be found here [AlexaForce Documentation](docs/README.md)
