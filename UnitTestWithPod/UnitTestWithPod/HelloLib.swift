//
//  HelloLib.swift
//  UnitTestWithPod
//
//  Created by SergeyBrazhnik on 18.11.2020.
//

import Foundation
import KeychainSwift
import UnitTestWithPod.OpenSSL
import Firebase
import FirebaseMessaging
import Combine

public class HelloLib: NSObject, MessagingDelegate{


    public static var shared : HelloLib = HelloLib()

    let keychain = KeychainSwift(keyPrefix: "HelloLib")
    
    public func helloWorld(){
        print("hello world")
    }

    public func returnZero() -> Int{
        0
    }
    
    public func saveString(key: String, value: String) {
        keychain.set(value, forKey: key,withAccess: .accessibleWhenPasscodeSetThisDeviceOnly)
    }

    public func getString(key: String) -> String? {
        keychain.get(key)
    }
    
    public func md5() -> String{
        var result = [UInt8](repeating: 0, count: Int(MD5_DIGEST_LENGTH))
        let source = Array("hello".utf8)
        MD5(source, source.count, &result)

        let resData = Data(result)
        return resData.hex
    }

    public func configure(application: UIApplication){
        
        
        
        // TODO Possible use named configuration AKA GoogleService-Info.json
        let frameworkBundle = Bundle.init(identifier: "com.ledgerleopard.UnitTestWithPod")
        let configPath = frameworkBundle!.path(forResource: "GoogleService-Info-SDK", ofType: "plist")
        let options = FirebaseOptions(contentsOfFile: configPath!)
        FirebaseApp.configure(options: options!)
        //FirebaseApp.configure()
        Messaging.messaging().delegate = self
        application.registerForRemoteNotifications()
        Messaging.messaging().token { token, error in
            if error == nil {
                print("Token from messaging = \(token)")
            } else{
                print("Error = \(error)")
            }
        }
    }
    
    public func newOne(){
        
    }

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




extension Data {
    public var hex : String{
            get {
                let str = map { (element) -> String in
                    String(format: "%02x", element)
                }
                return str.joined()
            }
        }

}
