//
//  AppDelegate.swift
//  AppticsDemo
//
//  Created by Saravanan S on 10/11/21.
//  master


import UIKit
import CoreData
import Apptics
//import MetricKit
import AppticsFeedbackKit
import AppticsFeedbackKitSwift
import AppticsEventTracker
import UserNotifications
import AppticsMessaging

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
//    var window: UIWindow?
    func scheduleLocalNotification(_ title: String, body : String, identifier : String){
        let center = UNUserNotificationCenter.current()

        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)

        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        center.add(request) { error in
          if let error = error {
            print("Error posting notification: \(error)")
          }
        }
    }
    
    func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
        print("handleEventsForBackgroundURLSession for identifier \(identifier)")
        if (identifier.hasPrefix("com.apptics.engagement.backgroundsession")){
          Analytics.getInstance().bgEngagementRequestSuccessBlock = completionHandler
            self.scheduleLocalNotification("BGTask", body: "Succesfully sent engagement data!", identifier: identifier)
        }
        if (identifier.hasPrefix("com.apptics.nonfatal.backgroundsession")){
          Analytics.getInstance().bgNonFatalRequestSuccessBlock = completionHandler
            self.scheduleLocalNotification("BGTask", body: "Succesfully sent non-fatal data!", identifier: identifier)
        }
     }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let initialViewController = storyboard.instantiateViewController(withIdentifier: "ListViewController")
//        self.window?.rootViewController = initialViewController
//        self.window?.makeKeyAndVisible()
//        Override point for customization after application launch.
        
        let email = "apple@stackoverflow.com"
//        let logger = Logger()
//        logger.log("\(email, privacy: .auto)")
//        logger.log("\(email, privacy: .auto(mask: .hash))")
//        logger.log("\(email, privacy: .private)")
//        logger.log("\(email, privacy: .private(mask: .hash))")
//        logger.log("\(email, privacy: .sensitive)")
//        logger.log("\(email, privacy: .sensitive(mask: .hash))")

//        let metricManager = MXMetricManager.shared
//        metricManager.add(self)
        
        self.initApptics()
        
        APLog().shouldLog = true
        APLog.setLogLevel(APLogLevel.all)
        APLog.setMaximumNumberOfLogFiles(2)
//        APLog.clearConsoleLogs()
        Test().log()
        

//        APThemeManager.sharedSettingsThemeManager().viewBGColor?()
        
        
        Apptics.setDefaultLanguage("en")
        
        
        application.registerForRemoteNotifications()
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
            if let error = error {
                // Handle the error here.
                print("Error::",error)
            }
            
            // Enable or disable features based on the authorization.
        }
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("BGTaskSchedulerNotification"), object: nil)
        
        print("registration status here:: \(application.isRegisteredForRemoteNotifications)")
        return true
    }
    
    @objc func methodOfReceivedNotification(notification: Notification) {
        let object : [String : Any] = notification.object as! [String : Any]
        if let error = object["error"]{
            self.scheduleLocalNotification("BGTask", body: "\(object["type"]!) \(object["status"]!) \(error)", identifier: "\(NSDate().timeIntervalSince1970)")
        }else{
            self.scheduleLocalNotification("BGTask", body: "\(object["type"]!) \(object["status"]!)", identifier: "\(NSDate().timeIntervalSince1970)")
        }
        
    }
    
    func initApptics(){
        
        
        
        
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = df.string(from: date)
        let provider = CustomArrayClass(elements: ["test1", "test2", dateString])
        let nsArray = provider.getNSArray()
        
      
        AppticsExtensionManager.trackEvent(groupname: "PRE_TEST_time", eventName: "EVENT_A", property: ["name":nsArray], appGroup: "group.com.ios.customproperties.test")
        
        
//        AppticsExtensionManager.trackEvent(groupname: "PRE_TEST_time", eventName: "EVENT_B", property: ["name":nsArray], appGroup: "group.com.ios.customproperties.test")

        let timedEventtest1 = AppticsExtensionManager.startTimedEvent(groupname: "AppLifecycleTimedone", eventName: "iOS_TimedEventone", property: [:], appGroup: "group.com.ios.customproperties.test")
        print(timedEventtest1)

        AppticsExtensionManager.endTimedEvent(startTime: timedEventtest1, groupname: "AppLifecycleTimed", eventName: "iOS_TimedEvent",appGroup: "group.com.ios.customproperties.test")


//
        let timedEventtest2 = AppticsExtensionManager.startTimedEvent(groupname: "AppLifecycleTimedtwo", eventName: "iOS_TimedEventtwo", property: ["name":nsArray], appGroup: "group.com.ios.customproperties.test")

        print(timedEventtest2)

        AppticsExtensionManager.endTimedEvent(startTime: timedEventtest2, groupname: "AppLifecycleTimed", eventName: "iOS_TimedEvent",appGroup: "group.com.ios.customproperties.test")


        AppticsExtensionManager.trackEvent(groupname: "Testingname", eventName: "case12", appGroup: "group.com.ios.customproperties.test")
        AppticsExtensionManager.trackEvent(groupname: "Test", eventName: "case2", appGroup: "group.com.ios.customproperties.test")
//        AppticsExtensionManager.trackEvent(groupname: "Test", eventName: "case3", appGroup: "group.com.ios.customproperties.test")
//        AppticsExtensionManager.trackEvent(groupname: "Test", eventName: "case4", appGroup: "group.com.ios.customproperties.test")

        
        let config = AppticsConfig.default
        config.sendDataOnMobileNetworkByDefault=true // 🤖​ Set true to send data on mobile network.
        config.trackOnByDefault=true // 🤖​ Set true to track on by default before user consent.
        config.enableBackgroundTask=false
        config.anonymousType = .pseudoAnonymous // 🤖​ Choose type of tracking you prefer, we support sudo-anonymous and non-anonymous.
        config.enableAutomaticEventTracking = true
        config.trackAllScreens = true
        config.enableAutomaticScreenTracking = true
//        config.completeOffByDefault = true
//        config.deviceIdentifierType = .randomId
        config.enableCrossPromotionAppsList = true // To enable Cross Promotion
        config.enableRateUs = true // To enable Rate us
        config.enableRemoteConfig = true // To enable remote config
        config.minSessionDuration = APMinSessionDuration.duration3
        config.maxSessionTimeout = APMaxSessionTimeout.timeout30//(60 * 30)
        config.flushInterval = APFlushInterval.interval15//(60 * 30)
        
//        APAAAUtil.sharedManagerForAnonymousUser().removeRefreshToken()
//        APAAAUtil.sharedManagerForAnonymousUser().removeTokenTime()
//
        
        APMessaging.startService()
        
        Apptics.initialize(withVerbose: true) // 🤖​ To initialise Apptics framework with or without verbose.
        Apptics.initialize(withVerbose: true, config: config)
//        APRemoteConfig.enable(true)
//        Apptics.setTypeOfAnonymity(APAnonymousType.none)
        Apptics.setCompleteOff(false)
//        Apptics.setPersonalInfoTrackingStatus(true)
        Apptics.enableReviewAndSendCrashReport(true) // 🤖​ To show review prompt before sending the crash report.
        if #available(iOS 13.0, *) {
            UINavigationBar.appearance().barTintColor = UIColor.systemBackground
            UINavigationBar.appearance().tintColor = UIColor.red
        } else {
            // Fallback on earlier versions
        }
        
        
        
        Apptics.setCrashConsentDismissCompletionHandler { status in
            print("status :: \(status)")
        }
        
        Apptics.setUserConsentPresentCompletionHandler { status, error in
            print("status :: \(status) error :: \(error)")
        }
        
//        Apptics.setUserConsentDismissCompletionHandler { status in
//            print(status)
//
//            for wScene in UIApplication.shared.connectedScenes
//            {
//                if (wScene.activationState == .foregroundActive || wScene.activationState == .foregroundInactive)
//                {
//                    for window in (wScene as! UIWindowScene).windows {
//                        if (window != nil) {
//                            if (object_getClassName(window.rootViewController) != object_getClassName(ZACustomAlertController.self)){
//                            Apptics.openAnalyticSettingsController(window.rootViewController)
//                            break;
//                            }
//                        }
//                    }
//                    break;
//                }
//            }
//
//        }
        
        if UIAccessibility.isReduceTransparencyEnabled {
            FeedbackKit.reducedTransparencyStatus(true)
        }
        else{
            FeedbackKit.reducedTransparencyStatus(false)
        }
        //loadFontForCPResourceBundle()
        
        FeedbackKit.startMonitoring(withShake: true, maxToleranceLimit: 3)
//        FeedbackKit.setSenderEmailAddress("ssaravanan@zohocorp.com")
        FeedbackKit.setMaskTextByDefault(false)

//        FeedbackKit.setSupportEmailAddress("ssaravanan@zoho.com")
        FeedbackKit.enableAnonymousUserAlert(true)
        FeedbackKit.showInfoBeforeSendingFeedback(toUser: false)
        
        FeedbackKit.enableAnonymousSender(false)
        
        
        let dignoInfo = [[["key": "", "value": "ZUID - 869382"], ["key": "Conversation View", "value": "All Folders"], ["key": "Conversation Action", "value": "Folders based"], ["key": "Mark entire conversation as read", "value": "off"], ["key": "Notification status", "value": "on"], ["key": "User timezone", "value": "Asia/Calcutta"], ["key": "Sender based notification", "value": "off"], ["key": "Folder based notification", "value": "off"], ["key": "Badge Notification", "value": "Inbox"], ["key": "Streams enabled", "value": "on"], ["key": "Streams notification enabled", "value": "on"]], [["key": "", "value": "DEVICE DETAILS"], ["key": "Device cache count", "value": "231 200 325"], ["key": "Device timezone", "value": "Asia/Kolkata"], ["key": "Device Notification status", "value": "Authorized"]]]
        FeedbackKit.setDiagnosticInfo(dignoInfo)
        
        FeedbackKit.setDiagnosticInfoObject(FeedbackDiagosticInfo(segments: [Segment(title: "App configuration", properties: [Property(name: "User Id", status: "ZUID - 869382"), Property(name: "Conversation", status: "Conversation View"), Property(name: "All Folders", status: "Folder Based"), Property(name: "Mark entire conversation as read", status: "off"), Property(name: "Notification status", status: "on"), Property(name: "User timezone", status: "Asia/Calcutta"), Property(name: "Sender based notification", status: "on")]),Segment(title: "Device configuration", properties: [Property(name: "User Id", status: "ZUID - 869382"), Property(name: "Conversation", status: "Conversation View"), Property(name: "All Folders", status: "Folder Based"), Property(name: "Mark entire conversation as read", status: "off"), Property(name: "Notification status", status: "on"), Property(name: "User timezone", status: "Asia/Calcutta"), Property(name: "Sender based notification", status: "on")])]))
        
        //AppticsExtensionManager.trackEvent(groupname: "Group", eventName: "SomeEvent", property: [:], appGroup: "group.com.apptics.remo.ios")
        APLog().shouldLog = true
        APLog.setLogLevel(APLogLevel.all)
//        APLog.setMaximumNumberOfLogFiles(2)
//        APLog.clearConsoleLogs()
        Test().log()
        
//        Mixpanl.initialize(token: "64e13d5de411a7e5b4453fc261ceaf9a")
//        Mixpanel.mainInstance().track(event: "Sign Up", properties: [
//            "source": "Pat's affiliate site",
//            "Opted out of email": true
//        ])
//        Mixpanel.mainInstance().loggingEnabled = true
//
        Apptics.setTheme(AppTheme())
//        Apptics.setFeedbackTheme(AppFeedbackTheme())
//        Apptics.setSettingsTheme(AppSettingsTheme())
//        Apptics.setUserConsentTheme(AppUserConsentTheme())
//        Apptics.setAppUpdateConsentTheme(AppInAppUpdateTheme())
        
//        Analytics.getInstance().loadExtension()
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
                                
    }
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "AppticsDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
//    event: "country_code", group: "bill"
        
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
//            APEvent.trackEvent(withType: ._Bills_save_attachment)
//        }
        
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenString = deviceToken.map { String(format: "%02x", $0) }.joined()
            print("Device Token: \(tokenString)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error)
    }
    
    // Implement this to display notification when app is in foreground.
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions)
                                  -> Void) {
        print("Notification body: \(notification.request.content.body)")
      completionHandler([.alert, .sound])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
    print("didReceive:\n")
      completionHandler()
    }

    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult)
                       -> Void) {
      print("Hidden message arrived:\n" + userInfo.debugDescription)
      // Log delivery signal for data/hidden/background messages
//      Messaging.serviceExtension().exportDeliveryMetricsToBigQuery(withMessageInfo: userInfo)
      completionHandler(.newData)
    }


}

//extension AppDelegate: MXMetricManagerSubscriber {
//  func didReceive(_ payloads: [MXMetricPayload]) {
//    guard let firstPayload = payloads.first else { return }
//    print(firstPayload.dictionaryRepresentation())
//    print("----------------------------------")
//  }
//
//  func didReceive(_ payloads: [MXDiagnosticPayload]) {
//    guard let firstPayload = payloads.first else { return }
//    print(firstPayload.dictionaryRepresentation())
//    print("----------------------------------")
//  }
//}






class CustomArrayClass {
    
    private var elements: [Any]
    
    init(elements: [Any]) {
        self.elements = elements
    }
    
    func getNSArray() -> NSArray {
        return NSArray(array: self.elements)
    }
}

