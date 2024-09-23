// swift-tools-version:5.3
 import PackageDescription
 let version = "2.1.2"
 let package = Package(
     name: "Apptics",
     defaultLocalization: "en",
     platforms: [.macOS(.v10_10), .iOS(.v9), .tvOS(.v9), .watchOS(.v2)],
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
         .target(
             name: "AppticsExtension",
             path: "SwiftFiles/AppExtension",
             resources: [
                 .copy("PrivacyInfo.xcprivacy")]
         ),
         .target(
             
             name: "AppticsAnalytics",
             dependencies: ["Apptics", "JWT", "AppticsEventTracker", "AppticsScreenTracker", "AppticsCrashKit", "KSCrash"], path: "SwiftFiles/Analytics"
         ),
         .target(
             name: "AppticsCrossPromotion",
             dependencies: ["AppticsAnalytics"],
             path: "SwiftFiles/CrossPromoApps",
             resources: [
                 .copy("PrivacyInfo.xcprivacy"),
                 .process("PromotedAppsController.xib"),
                 .process("PromotedAppViewCell.xib")
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
                 .copy("ScreenShotView.xib")
             ]
         )
     ]
 )
