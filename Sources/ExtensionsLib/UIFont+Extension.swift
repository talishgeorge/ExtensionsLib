//
//  File.swift
//  
//
//  Created by TCS on 18/07/20.
//

import UIKit

@available(iOS 8.2, *)
extension UIFont {
    
    static var avenirNextTab: UIFont {
        return UIFont.init(name: FontType.avenirNextCondensed.rawValue, size: 18) ?? UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light)
    }
    
    static var navigationTitle: UIFont {
        return UIFont.init(name: FontType.avenirNextCondensed.rawValue, size: 23) ?? UIFont.systemFont(ofSize: 23, weight: UIFont.Weight.light)
    }
    
    static var navigationAttributes: UIFont {
        return UIFont.init(name: FontType.avenirNextCondensed.rawValue, size: 16) ?? UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
    }
}
