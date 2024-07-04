//
//  PortfolioNavView.swift
//  DemoProject
//
//  Created by Saurabh  Verma on 10/06/24.
//

import UIKit

class PortfolioNavView: BaseView {
    // Define UI components
    private let profileBtn = UIButton()
    private let navTitleLabel = UILabel()
    private let searchBtn = UIButton()
    private let arrowBtn = UIButton()
    private let verticalSeparator = UIView()

    // Set up the view components
    override func setupView() {
        // Set the background color
        self.backgroundColor = .blue

        // Set properties for the UI components
        profileBtn.contentMode = .scaleAspectFit
        profileBtn.tintColor = .white  // Set the tint color

        navTitleLabel.textAlignment = .center
        navTitleLabel.textColor = .white  // Set the text color to be visible on blue background

        searchBtn.contentMode = .scaleAspectFit
        searchBtn.tintColor = .white  // Set the tint color

        arrowBtn.contentMode = .scaleAspectFit
        arrowBtn.tintColor = .white  // Set the tint color

        verticalSeparator.backgroundColor = .white  // Set the separator color to be visible

        // Add subviews
        addSubview(profileBtn)
        addSubview(navTitleLabel)
        addSubview(searchBtn)
        addSubview(arrowBtn)
        addSubview(verticalSeparator)

        // Set constraints using Auto Layout
        setupConstraints()
    }

    // Set constraints for the UI components
    private func setupConstraints() {
        // Disable autoresizing mask constraints
        profileBtn.translatesAutoresizingMaskIntoConstraints = false
        navTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        searchBtn.translatesAutoresizingMaskIntoConstraints = false
        arrowBtn.translatesAutoresizingMaskIntoConstraints = false
        verticalSeparator.translatesAutoresizingMaskIntoConstraints = false

        // Set constraints for left button
        NSLayoutConstraint.activate([
            profileBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileBtn.widthAnchor.constraint(equalToConstant: 24),
            profileBtn.heightAnchor.constraint(equalToConstant: 24)
        ])

        // Set constraints for title label
        NSLayoutConstraint.activate([
            navTitleLabel.leadingAnchor.constraint(equalTo: profileBtn.trailingAnchor, constant: 8),
            navTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        // Set constraints for right button 1
        NSLayoutConstraint.activate([
            searchBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            searchBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            searchBtn.widthAnchor.constraint(equalToConstant: 24),
            searchBtn.heightAnchor.constraint(equalToConstant: 24)
        ])

        // Set constraints for vertical separator
        NSLayoutConstraint.activate([
            verticalSeparator.trailingAnchor.constraint(equalTo: searchBtn.leadingAnchor, constant: -8),
            verticalSeparator.centerYAnchor.constraint(equalTo: centerYAnchor),
            verticalSeparator.widthAnchor.constraint(equalToConstant: 1),
            verticalSeparator.heightAnchor.constraint(equalToConstant: 24)
        ])

        // Set constraints for right button 2
        NSLayoutConstraint.activate([
            arrowBtn.trailingAnchor.constraint(equalTo: verticalSeparator.leadingAnchor, constant: -8),
            arrowBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowBtn.widthAnchor.constraint(equalToConstant: 24),
            arrowBtn.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    // Public methods to configure the view
    func setProfileBtn(_ image: UIImage?, target: Any?, action: Selector) {
        profileBtn.setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
        profileBtn.addTarget(target, action: action, for: .touchUpInside)
    }

    func setTitle(_ text: String) {
        navTitleLabel.text = text
    }

    func setSearchBtn(_ image: UIImage?, target: Any?, action: Selector) {
        searchBtn.setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
        searchBtn.addTarget(target, action: action, for: .touchUpInside)
    }

    func setArrowBtn(_ image: UIImage?, target: Any?, action: Selector) {
        arrowBtn.setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
        arrowBtn.addTarget(target, action: action, for: .touchUpInside)
    }
}
