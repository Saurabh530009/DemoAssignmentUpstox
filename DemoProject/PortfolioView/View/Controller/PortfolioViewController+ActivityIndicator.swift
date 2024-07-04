//
//  PortfolioViewController+ActivityIndicator.swift
//  DemoProject
//
//  Created by Saurabh  Verma on 12/06/24.
//

import UIKit

extension PortfolioViewController {
    func setupActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator?.hidesWhenStopped = true
        activityIndicator?.color = .gray // Set the color to gray for visibility
        activityIndicator?.translatesAutoresizingMaskIntoConstraints = false
        if let activityIndicator = activityIndicator {
            view.addSubview(activityIndicator)
            NSLayoutConstraint.activate([
                activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
            view.bringSubviewToFront(activityIndicator) // Bring activity indicator to the front
        }
    }
    
    
    func startActivityIndicator() {
        activityIndicator?.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityIndicator?.stopAnimating()
    }
}
