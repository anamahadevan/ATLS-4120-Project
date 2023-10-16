//
//  File.swift
//  Journal App (iOS)
//
//  Created by anabelle mahadevan on 10/16/23.
//

import Foundation
import NotificationCenter

class PushNotificationService{
    var isAllowed = false
    
    //making sure we are allowed to
    func askPermission(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success { // if they say yes, then allowed
                self.isAllowed = true
            } else if let error = error{ // if no return error
                print(error.localizedDescription)
            }
        }
    }
    
//    func sendNotif(title: String, subtitle: String) {
//        let notifContent = UNMutableNotificationContent()
//        notifContent.title = title
//        notifContent.subtitle = subtitle
//        
//        let trigger = UNNotificationTrigger(timeInterval:5 ,repeats: false)
//        
//        let notifRequest = UNNotificationRequest(identifier: UUID().uuidString, content: notifContent, trigger: trigger)
//    }
    
    
}
