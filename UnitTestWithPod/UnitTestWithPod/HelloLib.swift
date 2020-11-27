//
//  HelloLib.swift
//  UnitTestWithPod
//
//  Created by SergeyBrazhnik on 18.11.2020.
//

import Foundation
import KeychainSwift
import OpenSSL

public class HelloLib {
    
    static let keychain = KeychainSwift(keyPrefix: "HelloLib")
    
    public class func helloWorld(){
        print("hello world")
    }


    public class func returnZero() -> Int{
        0
    }
    
    public class func saveString(key: String, value: String) {
        keychain.set(value, forKey: key,withAccess: .accessibleWhenPasscodeSetThisDeviceOnly)
    }

    public class func getString(key: String) -> String? {
        keychain.get(key)
    }
    
    public class func md5() -> String{
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
