//
//  Created by TCS.
//  Copyright © 2020 TCS. All rights reserved.
// 

import UIKit

extension UIDevice {
    
    /// Device size
    static public var deviceSize: CGSize {
        UIScreen.main.bounds.size
    }
    
    /// Set userInterfaceIdiom as iPad
    static public func isIpad() -> Bool {
        self.current.userInterfaceIdiom == .pad
    }
    
    /// Set userInterfaceIdiom as iPhone
    @available(iOS 11.0, *)
    static public func isIPhoneX() -> Bool {
        guard self.current.userInterfaceIdiom == .phone,
            ( UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0.0) > 20.0 else {
                return false
        }
        return true
    }
    
    /// Set userInterfaceIdiom as iPadPro
    static public func isIpadPro() -> Bool {
        guard deviceSize.height == 768 else {
            return true
        }
        return false
    }
    
    /// Set userInterfaceIdiom as iPhoneX
    @available(iOS 11.0, *)
    static public func getAdditionalPaddingIfIphoneX() -> CGFloat {
        UIDevice.self.isIPhoneX() ? 20 : 0
    }
    
    /// Set device size height as iPhone5 or less
    static public func isDeviceiPhone5OrLess() -> Bool {
        if
            self.current.userInterfaceIdiom == .phone,
            deviceSize.height <= 568.0 {
            return true
        }
        return false
    }
    
    /// TurnOn Battery Monitoring
    static public func switchOnBatteryMonitoring() {
        self.current.isBatteryMonitoringEnabled = true
    }
    
    /// Set device size as iPhone5 or less
    static public func isiPhone5ORLess() -> Bool {
        UIDevice.current.userInterfaceIdiom == .phone && max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height) <= 568.0
    }
}
