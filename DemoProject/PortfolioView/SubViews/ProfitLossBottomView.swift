//
//  ProfitLossBottomView.swift
//  DemoProject
//
//  Created by Saurabh  Verma on 11/06/24.
//

import UIKit

class ProfitLossBottomView: BaseView {
    // Define UI components
    private let profitLossTitleLabel = UILabel()
    private let profitLossValueLabel = UILabel()
    private let seperatorView = UIView()
    let chevronBtn = UIButton(type: .system)
    
    private var isBtnTapped: Bool = false
    
    // Set up the view components
    override func setupView() {
        // Configure the subviews
        profitLossTitleLabel.text = "Profit & Loss"
        profitLossTitleLabel.textColor = UIColor(hexString: "#989DA5")
        
        chevronBtn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        chevronBtn.tintColor = .gray
        chevronBtn.contentMode = .scaleAspectFit
        chevronBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        profitLossValueLabel.text = ""
        profitLossValueLabel.textColor = .systemRed
        
        seperatorView.backgroundColor = UIColor(hexString: "#989DA5")
        
        // Add subviews
        addSubview(profitLossTitleLabel)
        addSubview(chevronBtn)
        addSubview(profitLossValueLabel)
        addSubview(seperatorView)
        
        profitLossTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        chevronBtn.translatesAutoresizingMaskIntoConstraints = false
        profitLossValueLabel.translatesAutoresizingMaskIntoConstraints = false
        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        
        // Setup constraints
        NSLayoutConstraint.activate([
            // Bottom left label constraints
            profitLossTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            profitLossTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            // Bottom image view constraints
            chevronBtn.leadingAnchor.constraint(equalTo: profitLossTitleLabel.trailingAnchor, constant: 8),
            chevronBtn.centerYAnchor.constraint(equalTo: profitLossTitleLabel.centerYAnchor),
            chevronBtn.widthAnchor.constraint(equalToConstant: 20),
            chevronBtn.heightAnchor.constraint(equalToConstant: 12),
            
            // Bottom right label constraints
            profitLossValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            profitLossValueLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            // Separator view constraints
            seperatorView.topAnchor.constraint(equalTo: topAnchor),
            seperatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            seperatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            seperatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    @objc private func buttonTapped() {
        isBtnTapped.toggle()
        let newImage = UIImage(systemName: isBtnTapped ? "chevron.up" : "chevron.down")
        chevronBtn.animateImageChange(to: newImage, duration: 1.0)
    }
}

extension ProfitLossBottomView {
    func setupData(profitLossVal: Double, pecentageProfitLoss: Double) {
        /// Create the main part of the text
        let mainText = "\(profitLossVal < 0 ? "-" : "")₹\(abs(profitLossVal)) "

        /// Create the percentage part of the text with a smaller font
        let percentageText = "(\(abs(pecentageProfitLoss))%)"
        
        let mainFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
        let percentageFont = UIFont.systemFont(ofSize: 11, weight: .semibold)
        let textColor = UIColor.systemRed
        
        // Create attributed strings using the generic method
        let mainAttributedString = NSAttributedString.attributedString(for: mainText, font: mainFont, color: textColor)
        let percentageAttributedString = NSAttributedString.attributedString(for: percentageText, font: percentageFont, color: textColor)
        
        // Combine the attributed strings
        let combinedAttributedString = NSMutableAttributedString()
        combinedAttributedString.append(mainAttributedString)
        combinedAttributedString.append(percentageAttributedString)

        // Set the attributed text to the label
        profitLossValueLabel.attributedText = combinedAttributedString
    }
}
