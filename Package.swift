// swift-tools-version:5.3
 import PackageDescription
 let version = "3.3.1"
 let package = Package(
     name: "Apptics",
     defaultLocalization: "en",
     platforms: [.macOS(.v10_10), .iOS(.v13), .tvOS(.v9), .watchOS(.v2)],
     products: [
         .library(
             name: "AppticsFeedbackKit",
             targets: ["AppticsFeedbackKit"]
         ),
         .library(
             name: "AppticsInAppUpdate",
             targets: ["AppticsInAppUpdate"]
             
         ),
         .library(
             name: "AppticsRateUs",
             targets: ["AppticsRateUs"]
         ),
         .library(
             name: "AppticsRemoteConfig",
             targets: ["AppticsRemoteConfig"]
         ),
         .library(
             name: "AppticsApiTracker",
             targets: ["AppticsApiTracker"]
         ),
         .library(
             name: "AppticsExtension",
             targets: ["AppticsExtension"]
         ),
         .library(
             name: "AppticsAnalytics",
             targets: ["AppticsAnalytics"]
         ),
         .library(
             name: "AppticsAnalyticscoreWithKSCrash",
             targets: ["AppticsAnalytics"]
         ),
         .library(
             name: "AppticsCrossPromotion",
             targets: ["AppticsCrossPromotion"]
         ),
         .library(
             name: "AppticsFeedbackKitSwift",
             targets: ["AppticsFeedbackKitSwift"]
         ),
         .library(
             name: "AppticsPrivacyShield",
             targets: ["AppticsPrivacyShield"]
         ),
         .library(
             name: "AppticsMessaging",
             targets: ["AppticsMessaging"]
         ),
         .library(
             name: "AppticsNotificationServiceExtension",
             targets: ["AppticsNotificationServiceExtension"]
         )
     ],
     targets: [
         .binaryTarget(
             name: "JWT",
             path: "JWT.xcframework"
         ),
         .binaryTarget(
             name: "Apptics",
             path: "Apptics.xcframework"
         ),
         .binaryTarget(
             name: "AppticsEventTracker",
             path: "AppticsEventTracker.xcframework"
         ),
         .binaryTarget(
             name: "AppticsScreenTracker",
             path: "AppticsScreenTracker.xcframework"
         ),
         .binaryTarget(
             name: "AppticsCrashKit",
             path: "AppticsCrashKit.xcframework"
         ),
         .binaryTarget(
             name: "KSCrash",
             path: "KSCrash.xcframework"
         ),
         .binaryTarget(
             name: "AppticsMXCrashKit",
             path: "AppticsMXCrashKit.xcframework"
         ),
         .binaryTarget(
             name: "AppticsFeedbackKit",
             path: "AppticsFeedbackKit.xcframework"
         ),
         .binaryTarget(
             name: "AppticsInAppUpdate",
             path: "AppticsInAppUpdate.xcframework"
         ),
         .binaryTarget(
             name: "AppticsRateUs",
             path: "AppticsRateUs.xcframework"
         ),
         .binaryTarget(
             name: "AppticsRemoteConfig",
             path: "AppticsRemoteConfig.xcframework"
         ),
         .binaryTarget(
             name: "AppticsApiTracker",
             path: "AppticsApiTracker.xcframework"
         ),
         .binaryTarget(
             name: "AppticsPrivacyShield",
             path: "AppticsPrivacyShield.xcframework"
         ),
         .binaryTarget(
             name: "AppticsMessaging",
             path: "AppticsMessaging.xcframework"
         ),
         .binaryTarget(
             name: "AppticsNotificationServiceExtension",
             path: "AppticsNotificationServiceExtension.xcframework"
         ),
         .target(
             name: "AppticsExtension",
             path: "SwiftFiles/AppExtension",
             resources: [
                 .copy("PrivacyInfo.xcprivacy")]
         ),
         .target(
             
             name: "AppticsAnalytics",
             dependencies: ["Apptics", "JWT", "AppticsEventTracker", "AppticsScreenTracker",  "AppticsMXCrashKit"], path: "SwiftFiles/Analytics"
         ),
         .target(
             
             name: "AppticsAnalyticscoreWithKSCrash",
             dependencies: ["Apptics", "JWT", "AppticsEventTracker", "AppticsScreenTracker", "AppticsCrashKit", "KSCrash"], path: "SwiftFiles/AnalyticswithkSCrash"
         ),
         .target(
             name: "AppticsCrossPromotion",
             dependencies: ["AppticsAnalytics"],
             path: "SwiftFiles/CrossPromoApps",
             resources: [
                 .copy("PrivacyInfo.xcprivacy"),
                 .process("PromotedAppsController.xib"),
                 .process("PromotedAppViewCell.xib"),
                 .copy("Fonts/Apptics-CP.ttf")
             ]
         ),
         .target(
             name: "AppticsFeedbackKitSwift",
             dependencies: ["AppticsFeedbackKit"],
             path: "SwiftFiles/AppticsFeedbackKit",
             resources: [
                 .copy("PrivacyInfo.xcprivacy"),
                 .copy("AppticsSdkIcons.ttf"),
                 .copy("FloatingView.xib"),
                 .copy("ScreenShotEditorView.xib"),
                 .copy("ScreenShotView.xib"),
                 .copy("QuartzResources.bundle")

             ]
         )
     ]
 )
