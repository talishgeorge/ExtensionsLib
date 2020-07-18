//
//  Created by TCS.
//  Copyright © 2020 TCS. All rights reserved.
// 

import UIKit

@objc extension UIApplication {
    
    /// Return App Version
    static public var appVersion: String? {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}
