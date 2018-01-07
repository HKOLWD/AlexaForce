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

# Step 4: Create an Alexa SKill on Amazon
Here's where all the Alexa magic happens. Log in to your Amazon developer account and find the Alexa Skills option. From your dashboard, go to Alexa -> Alexa Skills Kit. Here, click "Add a new skill".

A skill consists of several parts, Amazon's will guide you through the required steps. Some steps are optional, for example the Certification questions. Although AlexaForce fully supports certification of a skill, this is not required for skills in development or for demo purposes. Other steps are crucial, for example the wake word, and the interaction model. In the git repo you will find the JSON definition of the model that can be used with the provided APEX Sample Skill (AlexaModel.json). The model you create ultimately defines code you need to write to interact with it.

Alexa also allows you to define Dialogs, that allow you to put more of the control of the interaction between Alexa and the user inside the model. For example, you can let the model handle reprompting for required slots and determine completion of an Intent. AlexaForce supports both a Dialog model and a simpler JSON model.

The following parts are required to wire up the Alexa model with your Salesforce skill.

## Define the endpoint
In the "Configuration" section of the Alexa skill, you can use an AWS Lambda endpoint, or in this case HTTPS. Select HTTPS.

As Default endpoint, define your site name (from step 3) and add /services/apexrest/alexaforce/listener at the end. 

E.g. 
http://your-domain-developer-edition.eu8.force.com/alexa/services/apexrest/alexaforce/listener or 

http://your-domain-developer-edition.eu8.force.com/services/apexrest/alexaforce/listener



