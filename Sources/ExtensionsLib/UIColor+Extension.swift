//
//  Created by TCS.
//  Copyright © 2020 TCS. All rights reserved.
// 

import UIKit

extension UIColor {
    // Setup custom colours we can use throughout the app using hex values
    
    // MARK: - Properties

    static public let seemuBlue = UIColor(hex: 0x00adf7)
    static public let transparentBlack = UIColor(hex: 0x000000, a: 0.5)
    static public let appBackground = UIColor(hexString: "1e90ff")//UIColor(hexString: "0fbcf9")
    
    // MARK: - Initilization

    convenience public  init(hex: Int) {
        self.init(hex: hex, a: 1.0)
    }
    
    convenience public  init(hex: Int, a: CGFloat) {
        self.init(r: (hex >> 16) & 0xff, g: (hex >> 8) & 0xff, b: hex & 0xff, a: a)
    }
    
    convenience public  init(r: Int, g: Int, b: Int) {
        self.init(r: r, g: g, b: b, a: 1.0)
    }
    
    convenience public  init(r: Int, g: Int, b: Int, a: CGFloat) {
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: a)
    }
    
    convenience public  init?(hexString: String) {
        guard let hex = hexString.hex else {
            return nil
        }
        self.init(hex: hex)
    }
}
