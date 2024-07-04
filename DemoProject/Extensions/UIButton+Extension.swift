//
//  UIButton+Extension.swift
//  DemoProject
//
//  Created by Saurabh  Verma on 12/06/24.
//

import UIKit

extension UIButton {
    func animateImageChange(to newImage: UIImage?, duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration) { [weak self] in
            guard let self = self else { return }
            self.setImage(newImage, for: .normal)
            self.superview?.layoutIfNeeded() // Ensure the superview layout is updated
        }
    }
}
