//
//  UIView+Extension.swift
//  DemoProject
//
//  Created by Saurabh  Verma on 11/06/24.
//

import UIKit

extension UIView {
    enum RoundCornersAt {
        case topRight
        case topLeft
        case bottomRight
        case bottomLeft
    }
    
    // multiple corners using CACornerMask
    func roundCorners(corners: [RoundCornersAt], radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [
            corners.contains(.topRight) ? .layerMaxXMinYCorner : .init(),
            corners.contains(.topLeft) ? .layerMinXMinYCorner : .init(),
            corners.contains(.bottomRight) ? .layerMaxXMaxYCorner : .init(),
            corners.contains(.bottomLeft) ? .layerMinXMaxYCorner : .init()
        ]
    }
    // Method for animation data updating
    static func animateTransition(on view: UIView, duration: TimeInterval = 0.3, options: UIView.AnimationOptions = .transitionCrossDissolve, animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
        UIView.transition(with: view, duration: duration, options: options, animations: animations, completion: completion)
    }
}
