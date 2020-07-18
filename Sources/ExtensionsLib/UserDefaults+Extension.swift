//
//  Created by TCS.
//  Copyright © 2020 TCS. All rights reserved.
// 

import Foundation

extension UserDefaults {
    
    /// Save Dictionary to UserDeafults
    /// - Parameters:
    ///   - key: String Type
    ///   - dict: Dictionary
    ///   - type: Generic Type
    @available(iOS 11.0, *)
    static public func saveCustomDict<T>(withKey key: String, dict: [AnyHashable: Any], type: T.Type) {
        guard let dict = dict as? T else {
            print("Type mismatch")
            return
        }
        do {
            let archiver = try NSKeyedArchiver.archivedData(withRootObject: dict, requiringSecureCoding: false)
            UserDefaults.standard.set(archiver, forKey: key)
        } catch {
            print("Couldn't write to UserDefaults")
        }
        
    }
    
    /// Save Object to UserDeafults
    /// - Parameters:
    ///   - key: String Type
    ///   - custObj: Any Object type
    @available(iOS 11.0, *)
    static func saveCustomObject(withKey key: String, custObj: AnyObject?) {
        guard let obj = custObj else {
            return
        }
        do {
            let archiver = try NSKeyedArchiver.archivedData(withRootObject: obj, requiringSecureCoding: false)
            UserDefaults.standard.set(archiver, forKey: key)
        } catch {
            print("Couldn't write to UserDefaults")
        }
    }
    
    /// Get data from UserDeafults
    /// - Parameters:
    ///   - key: String Type
    ///   - type: Generic Type
    @available(iOS 11.0, *)
    static func getObject<T>(withKey key: String, type: T.Type) -> T? {
        let unarchivedObject = getDefaultData(withKey: key)
        return unarchivedObject as? T
    }
    
    /// Get data from UserDeafults
    /// - Parameter key: String Type
    @available(iOS 11.0, *)
    static func getDefaultData(withKey key: String) -> Any? {
        guard let data = UserDefaults.standard.object(forKey: key) else {
            return nil
        }
        guard let retrievedData = data as? Data else {
            return nil
        }
        do {
            return try NSKeyedUnarchiver.unarchivedObject(ofClasses: [NSObject.self], from: retrievedData)
        } catch {
            print("Error from reading UserDefaults")
            return nil
        }
        
    }
}
