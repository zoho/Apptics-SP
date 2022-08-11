# Apptics 
Apptics is a library that enables your app to send in-app usage reports and data securly to our servers. You can track Sessions, Screens, and we also offer Crash Reporting. With minimal initialization of the framework, you get these features without doing any other configuration.

## Development Requirements: 

The minimum support is for iOS 9.0, macOS 10.9, tvOS 9.0 and watchOS 3.0. 
Supported Swift version - 4.0.
Supported devices - iPhone, iPod, iPad, Mac, Apple watch and Apple tv. 
min Xcode version 9.0
 
## Getting Started

* All you need to do is create a project in the Apptics console using this link [link](https://apptics.zoho.com/ac/admin/setup) 

### Installation Option 1: Swift Package Manager

* Use Swift Package Manager to integrate Apptics in your project.
    * Add a package by selecting File → Add Packages… in Xcode’s menu bar.
    
    * Enter the package URL of Apptics-SP repository.
                        
            https://github.com/zoho/Apptics-SP
    
    * Next, set the Dependency Rule to be Up to Next Major Version.
    * Then, select Add Package.    
    * Choose the package of Apptics that you want installed. 

### Install Apptics scripts using cocoapods 

          pod 'Apptics-SDK/Scripts'
    
### Add “Run Script” to your Build Phases
* Click on the project, then on the main target, then on the “Build Phases” tab. 
* Click the + at the top left to create a new build phase; choose “New Run Script Phase”.
* Triple-click on “Run Script” to select it, and type “Apptics pre build”.
* Drag the new phase as close to the top of the list as possible. I’d prefer to put it at the very top, but Xcode reserves the topmost position for “Target Dependencies.”
* Click the triangle next to your build phase title to expand the phase. Make sure Shell is set to /bin/sh and “Run script only when installing” is not checked.
* Click into the black script box and paste in the following script. 

        #Pre build script will register the app version, upload dSYM file to the server and add apptics specific information to the main info.plist which will be used by the SDK.
        sh "./Pods/Apptics-SDK/scripts/run" --upload-symbols-for-configurations="Release, Appstore" 

    Usage:

        run --upload-symbols-for-configurations="Release, Appstore" --config-file-path="YOUR_PATH/apptics-config.plist" --app-group-identifier="group.com.company.application [Optional]"
        
    Parameters:

   * `--upload-symbols-for-configurations` String - Provide the configurations separated by comma for which the dSYM files should be uploaded.
   * `--config-file-path` String - Provide the path of apptics-config.plist file if to any sub directory instead of root.
   * `--app-group-identifier` String - App group identifier to support app extensions.

### Installation Option 2: CocoaPods

* Please visit [Apptics Github repo](https://github.com/zoho/Apptics) and follow the steps.

## Next 

* Create a new application or select an existing application from the quickstart page to download  the `apptics-config.plist`. Move the `apptics-config.plist` to the root of your Xcode project and add it to the necessary targets.


* In your `Appdelegate` class make sure you call the initialize method in app launch.

        Apptics.initialize(withVerbose: true)

* For AppExtensions call `Apptics.startExtensionSession("APP_GROUP_IDENTIFIER")` on start and `Apptics.stopExtensionSession()` at the end. 

***Note : The analytic data of App-Extensions will be sent by the main application based on the network availability.***  


## **Important**:
To get proper symbolicated crashes, make sure your build settings have the following when you ship your app.
 
* Strip Build Symbols During Copy - **NO**
* Strip Linked Product - **NO**
* Strip Style - **Debugging Symbols**
* Debug information format - **Dwarf with dSYM file**

# Features

## Session Tracking:

A session is considered when the app goes from foreground to background.  

## In-app Event Tracking: 

In-app event is tracking the post-install activities using the custom events.

## Screen Tracking: 

Screens are automatically tracked and the time spent on each screen is noted in iOS and tvOS. You can track screens manually using our [apis](https://prezoho.zohocorp.com/apptics/resources/SDK/iOS/screens.html)    
***Note: Viewcontrollers aren't tracked properly if you use third party containment controllers like DDMenuController, IIViewdeckController etc. To ensure to get a proper tracking of viewcontroller override `viewDidAppear` and `viewWillDisappear` in all your viewcontrollers.***

## Crash Reporting: 

Crashes are automatically tracked and symbolicated. To get proper symbolicated reports please make sure to configure your build settings correctly. 

The crashes will not be captured if the debugger is attached at the launch, please follow the below steps. 

  * Run your app from Xcode and install it on your simulator or device.
  * Quit the app using the stop button.
  * Launch the app from home screen and try to crash the app by invoking our readymade method `Apptics.crash()`.
  * Run the app again in order to push the crash to the server and get symbolicated.

Check the web console, you should find the crash listed in the console.

#### Missing a dSYM? 

Apptics includes a script to upload your project's dSYM automatically. The script is executed through the run-script in your projects build phases during the on-boarding process. There are some cases where dSYM upload fails because of network interruptions or if you have enabled bit code in your project. Missing dSYMs can be uploaded by following the below steps. 

#### Finding your dSYM 

While archiving your project build dSYMs are placed inside the xarchive directory. To view, open Xcode organizer window, ctrl+click or right click on the list to go to the dir in Finder. ctrl+click to view its content, inside the content you will find a dir called "dSYMs" which will contain dSYMs files, also that is the location where dSYMs are placed when you hit "download dSYM" in Xcode organizer. 

For Bitcode enabled applications the first step would be to check in iTunes connect whether you have enabled bit-code for your application. For bit-code enabled builds Apple generates new dSYMs. You will have to download the dsyms from ituneconnect or from the Xcode's organizer and upload to Apptics server. 

#### To download the dSYM files from iTunes Connect: 
* Log in to Apple [iTunes Connect](https://itunesconnect.apple.com/login).
* Select My Apps > (selected app) > Activity.
* From the list of builds for your application, select the build number you need for the dSYM.
* Select Download dSYM.

#### Uploading dSYMs 

On "Manage dSYM page" (Left menu -> Quality -> dSYM), upload the dSYMs .zip that you have downloaded from the iTunes connect for bitcode enabled or the one you find in xarchive directory.

## Theme 

You can use our protocols to customize the Analytics Settings, App updates and Feedback screens. Just create a swift/Obj class in the name of ThemeManager and extend those protocols to implement required methods [link]().

## Callbacks 

Get callbacks for all the events at a single point by extending `APCustomHandler`. It deals with user consent , crash consent, feedback, and ratings & reviews.

## Feedback and BugReporting

A seperate module that does "Shake to Feedback", please check if it suits your needs [here](https://prezoho.zohocorp.com/apptics/resources/SDK/iOS/in_app_feedback.html).
        
## App Updates 

Now you can prompt user to update to the latest version of your app from the App Store.  

Please check our  guide before you start [here](https://prezoho.zohocorp.com/apptics/resources/SDK/iOS/in_app_updates.html).

## Ratings and Reviews

Engage with your users and learn about their experience. Promopt them to rate your app after they have fulfilled the configured criteria.

Check how to configure automatic ratings [here](https://prezoho.zohocorp.com/apptics/resources/SDK/iOS/in_app_ratings.html).

    
## To know more!

For more information about how Apptics works, checkout the below links.    

* [Getting Started](https://prezoho.zohocorp.com/apptics/resources/user-guide/getting-started.html)
* [iOS user guide](https://prezoho.zohocorp.com/apptics/resources/SDK/iOS/integration.html) 
* [Sample app](https://github.com/zoho/Apptics/tree/master/AppticsDemo)

For any assistance, contact Apptics at [support@zohoapptics.com](support@zohoapptics.com)

    
