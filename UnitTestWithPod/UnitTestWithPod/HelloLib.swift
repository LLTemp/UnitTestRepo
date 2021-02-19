//
//  HelloLib.swift
//  UnitTestWithPod
//
//  Created by SergeyBrazhnik on 18.11.2020.
//

import Foundation
//import KeychainSwift
import UnitTestWithPod.OpenSSL
import Combine

public class HelloLib: NSObject{

    public static var shared : HelloLib = HelloLib()

    //let keychain = KeychainSwift(keyPrefix: "HelloLib")
    
    public func helloWorld(){
        print("hello world")
    }

    public func returnZero() -> Int{
        0
    }
    
//    public func saveString(key: String, value: String) {
//        keychain.set(value, forKey: key,withAccess: .accessibleWhenPasscodeSetThisDeviceOnly)
//    }
//
//    public func getString(key: String) -> String? {
//        keychain.get(key)
//    }
    
    public func md5() -> String{
        var result = [UInt8](repeating: 0, count: Int(MD5_DIGEST_LENGTH))
        let source = Array("hello".utf8)
        MD5(source, source.count, &result)

        let resData = Data(result)
        return resData.hex
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
