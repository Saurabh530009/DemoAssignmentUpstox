//
//  Utils+NSAttributedString.swift
//  DemoProject
//
//  Created by Saurabh  Verma on 12/06/24.
//

import UIKit

extension NSAttributedString {
    static func attributedString(for text: String, font: UIFont, color: UIColor) -> NSAttributedString {
        return NSAttributedString(string: text, attributes: [
            .font: font,
            .foregroundColor: color
        ])
    }
}
