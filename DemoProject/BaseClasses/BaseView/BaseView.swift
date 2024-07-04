//
//  BaseView.swift
//  DemoProject
//
//  Created by Saurabh  Verma on 11/06/24.
//

import UIKit

class BaseView: UIView {
    // Initialize and set up the view
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    // override this method for setup in the child view
    func setupView() {
        
    }
}
