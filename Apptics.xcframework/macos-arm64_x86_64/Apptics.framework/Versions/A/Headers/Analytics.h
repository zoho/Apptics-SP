//
//  JAnalytic.h
//  BugReporterTest
//
//  Created by Saravanan Selvam & Girdhar V.C on 29/10/15.
//  Copyright © 2015 Giridhar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Apptics/APLog.h>
#import <Apptics/ZAEnums.h>
#import <Apptics/APEventsEnum.h>

#if !TARGET_OS_OSX
#import <UIKit/UIKit.h>
#else
#import <Cocoa/Cocoa.h>
#endif

#if TARGET_OS_WATCH
#import <WatchKit/WatchKit.h>
#endif

#import <Apptics/ZAAlertStyle.h>

FOUNDATION_EXPORT double AnalyticsVersionNumber;

FOUNDATION_EXPORT const unsigned char AnalyticsVersionString[];

//static NSString * _Nonnull za_version = @"0.9";

#if AP_CROSS_PROMO
//@protocol PromotedAppsKitDelegate;
#endif

static NSString* _Nonnull engagementTaskID = @"com.apptics.engagement.bgtaskidentifier";
static NSString* _Nonnull nonfatalTaskID = @"com.apptics.nonfatal.bgtaskidentifier";

NS_ASSUME_NONNULL_BEGIN

/**
 *  Apptics is a library that enables your app to send usage reports and data securly to our servers. You get Session tracking, Screen tracking and Crash Reporting. Which means, with minimal setup of initializing the framework you can get these three features working without any other configuration.
 */

@interface Analytics : NSObject

/**
 *  Time to push all collected data to the servers
 */
@property (nonatomic) NSInteger flushInterval;

@property long zuid;//Zoho User Id
@property (strong,nonatomic) NSString *apiToken;
@property BOOL enableAutomaticEventTracking;
@property BOOL enableAutomaticSessionTracking;
@property BOOL enableAutomaticScreenTracking;
@property BOOL enableAutomaticCrashTracking;

@property BOOL enableAutoCheckForAppUpdate;

@property BOOL enableAnonymousTracking;

@property (nonatomic) APAnonymousType anonymousType;

//@property BOOL enableRateUs;

//@property BOOL enableRemoteConfig;

@property BOOL enableCrossPromotions;

@property BOOL isApplicationValid;

@property BOOL isCompleteStopIsActive;

@property BOOL enableBackgroundTask;

@property BOOL isApplicationInBg;

@property UserConsentPresentCompletionBlock _Nullable userConsentPresentCompletionBlock;

@property UserConsentDismissCompletionBlock _Nullable userConsentDismissCompletionBlock;

@property CrashConsentDismissCompletionBlock _Nullable crashConsentDismissCompletionBlock;

@property (nonatomic, retain) ZAAlertStyle * _Nullable alertStyle;

@property (nonatomic) BOOL isAppInstalledInWatch;

@property (nonatomic) BOOL enableReviewAndSendCrashReport;

#if !TARGET_OS_OSX && !TARGET_OS_WATCH
@property (nonatomic) UIBackgroundTaskIdentifier backgroundUpdateTask;
#endif

typedef void (^bgEngagementRequestSuccessBlock)(void);
@property (nonatomic) bgEngagementRequestSuccessBlock _Nullable bgEngagementRequestSuccessBlock;

typedef void (^internbgEngagementRequestSuccessBlock)(void);
@property (nonatomic) internbgEngagementRequestSuccessBlock _Nullable internbgEngagementRequestSuccessBlock;

typedef void (^bgNonFatalRequestSuccessBlock)(void);
@property (nonatomic) bgNonFatalRequestSuccessBlock _Nullable bgNonFatalRequestSuccessBlock;

typedef void (^internbgNonFatalRequestSuccessBlock)(void);
@property (nonatomic) internbgNonFatalRequestSuccessBlock _Nullable internbgNonFatalRequestSuccessBlock;

typedef void (^bgConsoleLogsRequestSuccessBlock)(void);
@property (nonatomic) bgConsoleLogsRequestSuccessBlock _Nullable bgConsoleLogsRequestSuccessBlock;

typedef void (^internbgConsoleLogsRequestSuccessBlock)(void);
@property (nonatomic) internbgConsoleLogsRequestSuccessBlock _Nullable internbgConsoleLogsRequestSuccessBlock;

/**
 *  Singleton instance
 *
 *  @return Instance of Analytics
 */
+ (Analytics *_Nonnull) getInstance;


/**
 *  A Setter method to set timezone
 *
 *  @param time TimeZone
 */

- (void) setTimeZone:(NSString *_Nonnull)time;

/**
 *  This is how you initialize Analytics.
 *  Use this method to initialize Analytics when you don't have an Authtoken.
 *  You can set the authtoken later on. When the authtoken is set, we'll be able to get the User details from Zoho IAM
 *  @param apiToken This is a Unique Token generated by the Analytics Website for your app
 *  @param status   This is the Enum of your build Status, Local, live or pre. Make sure you change during Testing and deployment
 */

-(void)initializeWithApiToken:(NSString*)apiToken withBuildType:(JBuildType)status shouldTrackDatabyDefault:(BOOL)shouldTrack sendDataOnMobileNetworkByDefault:(BOOL)sendDataOnMobileNetworkByDefault;

/**
 *  This is how you initialize Analytics.
 *  Use this method to initialize Analytics when you don't have an Authtoken.
 *  You can set the authtoken later on. When the authtoken is set, we'll be able to get the User details from Zoho IAM
 *  @param apiToken This is a Unique Token generated by the Analytics Website for your app
 *  @param status   This is the Enum of your build Status, Local, live or pre. Make sure you change during Testing and deployment
 */

- (void)initializeWithApiToken:(NSString*_Nonnull)apiToken withBuildType:(JBuildType)status;


/**
 *  Set this Method in your Reachabilty class. We'd want to send analytics data to our servers only when the internet is up.
 *  We didn't want to write another reachability class because we know you'd have one in your app. Make sure you set this because, if you dont set this, we assume you dont have wifi.
 *
 *  @param state NSInteger variable that sets the reachability via WiFi or WWAN.
 *  0 = not reachable
 *  1 = reachable via WiFi
 *  2 = reachable via WWAN
 */
- (void) setReachable:(NSInteger) state;

- (void) trackException:(NSException*_Nonnull) exception;

- (void) trackError:(NSError*_Nonnull) error;

- (void) trackException:(NSException*_Nonnull) exception withKey : (NSString*) key;

- (void) trackError:(NSError*_Nonnull) error withKey : (NSString*) key;

- (void) trackNonNativeException:(NSString *_Nonnull) name message :(NSString *_Nonnull) message stackTrace : (NSString* _Nonnull) stackTrace type : (NSString* _Nonnull) type withKey : (NSString*) key;

- (void) trackSignUp:(NSString* _Nullable)userID groupId : (NSString*_Nullable)groupid;

- (void) trackLogIn:(NSString* _Nullable)userID groupId : (NSString*_Nullable)groupid;

- (void) trackLogOut:(NSString* _Nullable)userID groupId : (NSString*_Nullable)groupid;

/**
 *  Clears all user info from the app.
 *  
 *  - Warning:
 *  Don't call this method in production
 */

-(void) resetConsentPreference;

/**
 *  Clears all stored data, without sending info to the server.
 */

- (void) reset;

/**
 *  Flushes all events,sessions and pretty much everything that's tracked so far to the server, right away. You might typically want to use this when the user is gonna log out, or pretty much, whenever you need it.
 */

- (void) flushAllImmediately;


/**
 *  Use this method for setting BD Base domain. Like zoho.com or zoho.eu or zoho.com.cn etc.
 *
 *  @param BD String
 */

-(void) setBaseDomain:(NSString*_Nonnull)BD forUserID : (NSString*_Nonnull) userID;

/**
 *  Notifies the user using a UIAlertViewController in case there's an update for your app.
 *
 *  @param status bool switch, switch it off if you don't want the framework to notify the user when the app gets updated.
 */
//- (void) notifyForVersionUpdate:(BOOL)status; //FIXME: Change name

- (void) setCrashCustomProperty:(NSDictionary* _Nonnull) object;

- (void) setCurrentUser:(NSString* _Nullable)userID groupId : (NSString*_Nullable)groupid;

- (void) setUserAgent:(NSString*_Nullable) agent;

- (NSURL*_Nonnull) crashUrl;

/**
 *  Tells StoreKit to ask the user to rate or review your app, if appropriate.
 *
 *  You can prompt for rating up to three times in a 365-day period.
 *
 *  Avoid calling this function in response to a user action.
 *
 *  When you call this method while your app is still in development mode, a rating/review request view is always displayed so that you can test the user interface and experience. However, this method has no effect when you call it in an app that you distribute using TestFlight.
 *
 */

- (void) personalInfoTrackingStatus : (BOOL) status;

- (void) setTrackingStatus : (BOOL) status;

- (void) registerDevice:(void (^_Nullable)(NSString* deviceId))success;

- (NSString *_Nonnull) getCurrentMamId;

- (NSString *_Nonnull) getMamForRequest;

- (NSString *) getCurrentUserId;

- (APPrivacyStatus) getPrivacyStatus;
    
- (void) showPrivacyConsent : (id _Nullable) viewController;

#if !TARGET_OS_OSX && !TARGET_OS_WATCH

- (void) openPIIManagerController : (id _Nullable) viewController;

-(id _Nonnull) getAnalyticSettingsController;

#else

- (void) openPIIManagerController;

#endif
- (BOOL) canSendData;

- (BOOL) shouldCollectData;

- (BOOL) shouldCollectCustomProps;

- (BOOL) shouldSendPersonalizedData;

- (BOOL) isUserLoggedIn;

- (void) setSendDataInMobileNetwork : (BOOL) sendData;

- (BOOL) sendDataInMobileNetwork;

- (BOOL) crashReportPermissionStatus;

- (void) setCrashReportPermissionStatus : (BOOL) status;

- (BOOL) crashReportStatus;

- (void) setCrashReportStatus : (BOOL) status;

- (BOOL) logStatus;

- (void) setLogStatus : (BOOL) status;

- (void) updateAlwaysSendReportStatusToMobile : (BOOL) status type: (NSString*_Nonnull) type;

- (NSString*_Nonnull) getDCLBD;

- (NSString*_Nonnull) getLocalizableStringForKey:(NSString *_Nonnull)key;

-(BOOL) isAppExtension;

-(void) startAppexSession;

-(void) stopAppexSession;

#pragma mark - Application delegates

- (void) applicationDidFinishLaunching : (NSNotification*) notice;

- (void) applicationDidEnterBackground:(NSNotification*) notification;

- (void) applicationWillEnterForeground:(NSNotification*) notification;

- (void) applicationWillResignActive : (NSNotification*) notice;

- (void) applicationDidBecomeActive : (NSNotification*) notice;

- (void) didRecieveMemoryWarning: (NSNotification*)notification;

- (void) appWillTerminate:(NSNotification *)notice;

- (void) sceneWillEnterForeground:(NSNotification *)notice;

- (void) sceneDidEnterBackground:(NSNotification *)notice;

#pragma mark - Cross Promotion Apps

- (void) enableCrossPromotionAppsList : (bool) status;

-(NSDictionary *)getPromotionalAppsData : (void (^)(id info))success;

//- (id) getPromotionalAppsViewController:(NSString*)sectionHeader1 : (NSString*)sectionHeader2;

- (void) presentPromotionalAppsController : (id)vc;

- (void) promoAppselectedWithCrossPromoId:(NSNumber *)crossPromoId status:(NSNumber *)status;

- (void) ap_openURLWithUrl:(NSURL *)url;

- (BOOL) ap_canOpenURLWithUrl:(NSURL *)url;

#pragma mark - BGTask

-(void) cancelAllPendingBGTask;

#pragma mark - Reachability 

-(BOOL)isReachable;

@end

NS_ASSUME_NONNULL_END
