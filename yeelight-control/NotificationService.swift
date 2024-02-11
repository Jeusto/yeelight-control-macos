//
//  NotificationService.swift
//  yeelight-control
//
//  Created by Arhun Saday on 11/02/2024.
//

import Foundation
import UserNotifications

class NotificationService {
    static func showNotification(title: String, body: String) {
        print("Attempting to show notification...")

        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil) // trigger: nil for immediate delivery
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            }
        }
    }
}

func requestNotificationPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
        if granted {
            print("Notification permission granted.")
        } else if let error = error {
            print("Notification permission error: \(error)")
        }
    }
}
