Evernote SDK for ActionScript 
==================================================

Evernote API version 1.22

Overview
--------
This SDK contains wrapper code used to call the Evernote Cloud API from Flash and AIR apps.

Prerequisites
-------------
In order to use the code in this SDK, you need to obtain an API key from http://dev.evernote.com/documentation/cloud. You'll also find full API documentation on that page.

In order to run the sample code, you need a user account on the sandbox service where you will do your development. Sign up for an account at https://sandbox.evernote.com/Registration.action 


Building the evernote.swc Library
---------------------------------
You can either include the SDK wrapper source code in your apps or include the evernote.swc library file.

A project is included in the evernote-sdk-as3 directory that builds the evernote.swc library and points to the SDK wrapper source files.

Note:  The project files are: 
   * .actionScriptProperties
   * .flexLibProperties
   * .project

To open this project in Flash Builder and build the evernote.swc file:

  1. Under File, select "import Flash Builder project" 
  2. Select "Project Folder" and Browse to the "evernote-sdk-as3" folder
  3. Under Project, select "Build All"

After building the project, the evernote-sdk-as3/bin directly will contain evernote.swc.  You can include this library in your projects to use the Evernote SDK.
