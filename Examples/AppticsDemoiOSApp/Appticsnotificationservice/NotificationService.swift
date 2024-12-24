//
//  NotificationService.swift
//  Appticsnotificationservice
//
//  Created by admin on 23/12/24.
//


import AppticsNotificationServiceExtension
import UserNotifications

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?
    override func didReceive(
        _ request: UNNotificationRequest,
        withContentHandler contentHandler: @escaping (UNNotificationContent) ->
            Void
    ) {
        self.contentHandler = contentHandler
        bestAttemptContent =
            (request.content.mutableCopy() as? UNMutableNotificationContent)
        guard let bestAttemptContent = bestAttemptContent else { return }
        // Initialise Apptics notification extension
        let apext = APPushNotificationExtension()
        // Pass the app group identifier share and update the badge count.
        apext.appGroup = "group.com.jambav.appticsapp"
        // Check and pass the notification request to Apptics extension handler
        if apext.isNotification(fromApptics: request) {
//            apext.didReceive(
//                request, with: bestAttemptContent,
//                contentHandler: contentHandler)
            apext.didReceive(with: bestAttemptContent, contentHandler: contentHandler)
            
        } else {
            contentHandler(bestAttemptContent)
        }
    }
    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        if let bestAttemptContent = bestAttemptContent {
            contentHandler?(bestAttemptContent)
        }
    }
}
