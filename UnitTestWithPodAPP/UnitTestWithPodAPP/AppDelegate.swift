//
//  AppDelegate.swift
//  UnitTestWithPodAPP
//
//  Created by SergeyBrazhnik on 19.11.2020.
//

import UIKit
import Firebase
import UnitTestWithPod

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        application.registerForRemoteNotifications()
        
        // configure SIC firebase
        //HelloLib.shared.configure(application: application)
        HelloLib.shared.newOne()
        return true
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
    
    // MARK: Push notifications
        // notification received
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("didReceiveRemoteNotification")
        
        switch UIApplication.shared.applicationState {
        case .active, .inactive:
            print("Active state")

        case .background:
            print("Background state")
        default:
            print("the default state")
            break
        }

        completionHandler(.newData)
    }
}

// update Firebase token to server
extension AppDelegate: MessagingDelegate {
    public func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?){
        // todo detect that token from SDK config file
        if let fcmToken = fcmToken {
            //todo send to server
            print("SDK fcmToken = \(fcmToken)")
        } else {
            print("SDK fcmToken is empty!!!!")
        }
    }
}

