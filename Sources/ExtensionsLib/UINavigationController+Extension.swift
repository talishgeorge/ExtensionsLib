//
//  Created by TCS.
//  Copyright © 2020 TCS. All rights reserved.
// 

import UIKit

extension UINavigationController {
    
    /// Pop to Last View Controller
    /// - Parameters:
    ///   - ofClass: class type
    ///   - animated: bool
    public func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let viewController = viewControllers.last(where: {$0.isKind(of: ofClass)}) {
             popToViewController(viewController, animated: animated)
        }
    }
}
