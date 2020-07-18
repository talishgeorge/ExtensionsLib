//
//  Created by TCS.
//  Copyright © 2020 TCS. All rights reserved.
// 

import UIKit
import Foundation

extension UIView {
    
    /// Load View From Nib
    /// - Parameters:
    ///   - nibName: String
    ///   - bundle: Bundle type
    public  func loadViewFromNib(nibName: String, bundle: Bundle = Bundle.main) -> UIView {
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView ?? UIView()
    }
    
    /// Custom SubView
    /// - Parameter subView: UIView Type
    public func addCustomSubview(subView: UIView?) {
        guard let view = subView else {
            return
        }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}

extension UIView {
    @available(iOS 9.0, *)
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    @available(iOS 9.0, *)
    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor, let padding = paddingTop {
            self.topAnchor.constraint(equalTo: topAnchor, constant: padding).isActive = true
        }
    }
    
    @available(iOS 9.0, *)
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil,
                 paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }
    
    @available(iOS 9.0, *)
    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    @available(iOS 9.0, *)
    func setHeight(height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    @available(iOS 9.0, *)
    func setWidth(width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    @available(iOS 9.0, *)
    func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superviewTopAnchor = superview?.topAnchor,
            let superviewBottomAnchor = superview?.bottomAnchor,
            let superviewLeadingAnchor = superview?.leftAnchor,
            let superviewTrailingAnchor = superview?.rightAnchor else { return }
        
        anchor(top: superviewTopAnchor, left: superviewLeadingAnchor,
               bottom: superviewBottomAnchor, right: superviewTrailingAnchor)
    }
}

@available(iOS 13.0, *)
extension UIView {
    static public func gradientButton(customButton: UIView, viewButton: UIButton) {
        let newView = UIView(frame: CGRect(x: 0, y: 0, width: customButton.frame.width, height: customButton.frame.height))
        newView.clipsToBounds = true
        newView.layer.cornerRadius = customButton.frame.height/2
        newView.layer.borderWidth = 0.8
        newView.layer.borderColor = UIColor.white.cgColor
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor(named: ThemeColor.themeBlueTop.rawValue)?.cgColor ?? UIColor.systemIndigo, UIColor(named: ThemeColor.themeBottom.rawValue)?.cgColor ?? UIColor.systemTeal]
        gradient.locations = [0, 1]
        newView.layer.insertSublayer(gradient, at: 0)
        gradient.frame = newView.frame
        // Add UIView as a Subview
        customButton.addSubview(newView)
        customButton.addSubview(viewButton)
    }
}
