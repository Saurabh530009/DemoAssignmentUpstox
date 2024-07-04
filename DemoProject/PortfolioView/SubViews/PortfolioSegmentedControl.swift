//
//  CustomSegmentView.swift
//  DemoProject
//
//  Created by Saurabh  Verma on 10/06/24.
//

import UIKit

protocol PortfolioSegmentedControlDelegate: AnyObject {
    func didChangeSegment(to index: Int)
}

class PortfolioSegmentedControl: BaseView {
    // Define UI components
    private let leftButton = UIButton(type: .system)
    private let rightButton = UIButton(type: .system)
    private let underlineView = UIView()
    
    weak var delegate: PortfolioSegmentedControlDelegate?
    
    var selectedSegmentIndex: Int = 0 {
        didSet {
            updateSegmentControl()
        }
    }
    
    // Set up the view components
    override func setupView() {
        // Configure the buttons
        leftButton.setTitle("POSITIONS", for: .normal)
        leftButton.setTitleColor(.gray, for: .normal)
        leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        
        rightButton.setTitle("HOLDINGS", for: .normal)
        rightButton.setTitleColor(.gray, for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        
        // Configure the underline view
        underlineView.backgroundColor = UIColor.red
        
        // Add subviews
        addSubview(leftButton)
        addSubview(rightButton)
        addSubview(underlineView)
        
        // Set constraints
        setupConstraints()
        
        // Initial selection
        updateSegmentControl()
    }
    
    private func setupConstraints() {
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Left button constraints
            leftButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftButton.topAnchor.constraint(equalTo: topAnchor),
            leftButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            leftButton.trailingAnchor.constraint(equalTo: rightButton.leadingAnchor),
            leftButton.widthAnchor.constraint(equalTo: rightButton.widthAnchor),
            
            // Right button constraints
            rightButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            rightButton.topAnchor.constraint(equalTo: topAnchor),
            rightButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // Underline view constraints
            underlineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 4),
            underlineView.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
    
    private func updateSegmentControl() {
        let selectedColor: UIColor = .black
        let unselectedColor: UIColor = .gray
        let selectedFont: UIFont = UIFont.systemFont(ofSize: 14, weight: .bold)
        let unselectedFont: UIFont = UIFont.systemFont(ofSize: 14, weight: .semibold)

        // Ensure layout is updated
        layoutIfNeeded()
        var frame = CGRect.zero
        let height: CGFloat = 2 // Height of the underline view

        // Update frame of underlineView
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            switch selectedSegmentIndex {
            case 0:
                self.leftButton.setTitleColor(selectedColor, for: .normal)
                self.leftButton.titleLabel?.font = selectedFont
                self.rightButton.setTitleColor(unselectedColor, for: .normal)
                self.rightButton.titleLabel?.font = unselectedFont
                let width = leftButton.bounds.width
                frame = CGRect(x: leftButton.bounds.minX, y: bounds.height - height, width: width, height: height)
            case 1:
                self.leftButton.setTitleColor(unselectedColor, for: .normal)
                self.leftButton.titleLabel?.font = unselectedFont
                self.rightButton.setTitleColor(selectedColor, for: .normal)
                self.rightButton.titleLabel?.font = selectedFont
                let width = rightButton.bounds.width
                frame = CGRect(x: rightButton.bounds.minX, y: bounds.height - height, width: width, height: height)
            default:
                break
            }
            // Apply the calculated frame to the underline view
            underlineView.frame = frame
        }
    }
    
    @objc private func leftButtonTapped() {
        selectedSegmentIndex = 0
        delegate?.didChangeSegment(to: selectedSegmentIndex)
    }
    
    @objc private func rightButtonTapped() {
        selectedSegmentIndex = 1
        delegate?.didChangeSegment(to: selectedSegmentIndex)
    }
    
    func setLeftBtnTitle(title: String) {
        leftButton.setTitle(title, for: .normal)
    }
    
    func setRightBtnTitle(title: String) {
        rightButton.setTitle(title, for: .normal)
    }
}
