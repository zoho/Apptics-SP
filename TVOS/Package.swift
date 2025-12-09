// swift-tools-version: 5.8.0
 import PackageDescription
 let version = "3.3.8006"
 let package = Package(
     name: "Apptics_TVOS",
     defaultLocalization: "en",
     platforms: [.tvOS(.v12)],
     products: [
        
        .library(
            name: "AppticsRemoteConfig",
            targets: ["AppticsRemoteConfig"]
        ),
        .library(
            name: "AppticsApiTracker",
            targets: ["AppticsApiTracker"]
        ),
        .library(
            name: "AppticsAnalyticscoreWithKSCrash",
            targets: ["AppticsAnalyticscoreWithKSCrash"]
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
            name: "AppticsApiTracker",
            path: "AppticsApiTracker.xcframework"
        ),
         .binaryTarget(
             name: "KSCrash",
             path: "KSCrash.xcframework"
         ),
         .binaryTarget(
             name: "AppticsRemoteConfig",
             path: "AppticsRemoteConfig.xcframework"
         ),
        .target(
            name: "AppticsAnalyticscoreWithKSCrash",
            dependencies: ["Apptics", "JWT", "AppticsEventTracker", "AppticsScreenTracker", "AppticsCrashKit", "KSCrash"],
            path: "SwiftFiles/AnalyticswithkSCrash"
        )
     ]
 )
