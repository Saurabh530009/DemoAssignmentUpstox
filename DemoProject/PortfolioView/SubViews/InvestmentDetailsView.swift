//
//  InvestmentDetailsView.swift
//  DemoProject
//
//  Created by Saurabh  Verma on 11/06/24.
//

import UIKit

class InvestmentDetailsView: BaseView {
    /// Define UI components
    private let todayProfitLossTitleLabel = UILabel()
    private let totalInvestmentTitleLabel = UILabel()
    private let currentTitleLabel = UILabel()
    private let todayProfitLossValueLabel = UILabel()
    private let totalInvestmentValueLabel = UILabel()
    private let currentValueLabel = UILabel()
    private let separatorView = UIView()
    
    /// Set up the view components
    override func setupView() {
        // Configure the labels
        currentTitleLabel.text = "Current value"
        totalInvestmentTitleLabel.text = "Total investment"
        todayProfitLossTitleLabel.text = "Today's Profit & Loss"
        
        todayProfitLossTitleLabel.textColor = UIColor(hexString: "#989DA5")
        totalInvestmentTitleLabel.textColor = UIColor(hexString: "#989DA5")
        currentTitleLabel.textColor = UIColor(hexString: "#989DA5")
        
        todayProfitLossValueLabel.text = ""
        totalInvestmentValueLabel.text = ""
        currentValueLabel.text = ""
        
        totalInvestmentValueLabel.textColor = UIColor(hexString: "#989DA5")
        currentValueLabel.textColor = UIColor(hexString: "#989DA5")
        todayProfitLossValueLabel.textColor = .systemRed
        
        separatorView.backgroundColor = UIColor(hexString: "#989DA5")
        
        /// Add subviews
        addSubview(todayProfitLossTitleLabel)
        addSubview(totalInvestmentTitleLabel)
        addSubview(currentTitleLabel)
        addSubview(todayProfitLossValueLabel)
        addSubview(totalInvestmentValueLabel)
        addSubview(currentValueLabel)
        addSubview(separatorView)
        
        // Configure label constraints
        todayProfitLossTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        totalInvestmentTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        currentTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        todayProfitLossValueLabel.translatesAutoresizingMaskIntoConstraints = false
        totalInvestmentValueLabel.translatesAutoresizingMaskIntoConstraints = false
        currentValueLabel.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        // Setup constraints
        NSLayoutConstraint.activate([
            // Left labels constraints
            todayProfitLossTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            todayProfitLossTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            totalInvestmentTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            totalInvestmentTitleLabel.bottomAnchor.constraint(equalTo: todayProfitLossTitleLabel.topAnchor, constant: -16),
            
            currentTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            currentTitleLabel.bottomAnchor.constraint(equalTo: totalInvestmentTitleLabel.topAnchor, constant: -16),
            
            // Right labels constraints
            todayProfitLossValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            todayProfitLossValueLabel.centerYAnchor.constraint(equalTo: todayProfitLossTitleLabel.centerYAnchor),
            
            totalInvestmentValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            totalInvestmentValueLabel.centerYAnchor.constraint(equalTo: totalInvestmentTitleLabel.centerYAnchor),
            
            currentValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            currentValueLabel.centerYAnchor.constraint(equalTo: currentTitleLabel.centerYAnchor),
            
            // Separator view constraints
            separatorView.topAnchor.constraint(equalTo: topAnchor),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

extension InvestmentDetailsView {
    func setupData(currentValue: Double, totalInvestment: Double, todayProfitLoss: Double) {
        todayProfitLossValueLabel.text = "\(todayProfitLoss < 0 ? "-" : "")₹\(abs(todayProfitLoss))"
        totalInvestmentValueLabel.text = "₹ \(totalInvestment)"
        currentValueLabel.text = "₹ \(currentValue)"
    }
}
