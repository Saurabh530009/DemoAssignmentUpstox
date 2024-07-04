//
//  UserHoldingTableViewCell.swift
//  DemoProject
//
//  Created by Saurabh  Verma on 11/06/24.
//

import UIKit

class UserHoldingTableViewCell: UITableViewCell {
    // Labels for the top-left corner
    private let companyNameLabel = UILabel()
    private let netQuantityTitleLabel = UILabel()
    private let netQuantityValueLabel = UILabel()
    
    // Labels for the top-right corner
    private let ltpValueLabel = UILabel()
    private let ltpTitleLabel = UILabel()
    
    // Labels for the bottom-right corner
    private let profitLossValueLabel = UILabel()
    private let profitLossTitleLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupSubviews()
    }
    private func setupSubviews() {
        // Configure labels for the top-left corner
        addSubview(companyNameLabel)
        addSubview(netQuantityTitleLabel)
        addSubview(netQuantityValueLabel)
        
        // Configure labels for the top-right corner
        addSubview(ltpValueLabel)
        addSubview(ltpTitleLabel)
        
        // Configure labels for the bottom-right corner
        addSubview(profitLossValueLabel)
        addSubview(profitLossTitleLabel)
        
        // Configure label properties
        // (you may need to adjust font, color, size, etc. to fit your design)
        companyNameLabel.text = ""
        netQuantityTitleLabel.text = "NET QTY:"
        netQuantityTitleLabel.textColor = UIColor.lightGray
        netQuantityTitleLabel.font = UIFont.systemFont(ofSize: 10)
        netQuantityValueLabel.text = ""
        netQuantityValueLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        ltpTitleLabel.text = "LTP:"
        ltpTitleLabel.font = UIFont.systemFont(ofSize: 10)
        ltpTitleLabel.textColor = UIColor.lightGray
        ltpValueLabel.text = ""
        ltpValueLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        profitLossTitleLabel.text = "P&L:"
        profitLossTitleLabel.font = UIFont.systemFont(ofSize: 10)
        profitLossTitleLabel.textColor = UIColor.lightGray
        profitLossValueLabel.text = ""
        profitLossValueLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        // Setup constraints for labels (adjust as needed)
        setupConstraints()
    }
}
extension UserHoldingTableViewCell {
    private func setupConstraints() {
        // Top-left labels
        companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        netQuantityTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        netQuantityValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Top-left labels constraints
        NSLayoutConstraint.activate([
            companyNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            companyNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            netQuantityTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            netQuantityTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            netQuantityValueLabel.centerYAnchor.constraint(equalTo: netQuantityTitleLabel.centerYAnchor, constant: 0),
            netQuantityValueLabel.leadingAnchor.constraint(equalTo: netQuantityTitleLabel.trailingAnchor, constant: 12)
        ])
        
        // Top-right labels
        ltpValueLabel.translatesAutoresizingMaskIntoConstraints = false
        ltpTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Top-right labels constraints
        NSLayoutConstraint.activate([
            ltpValueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            ltpValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            ltpTitleLabel.centerYAnchor.constraint(equalTo: ltpValueLabel.centerYAnchor, constant: 0),
            ltpTitleLabel.trailingAnchor.constraint(equalTo: ltpValueLabel.leadingAnchor, constant: -12)
        ])
        
        // Bottom-right labels
        profitLossValueLabel.translatesAutoresizingMaskIntoConstraints = false
        profitLossTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Bottom-right labels constraints
        NSLayoutConstraint.activate([
            profitLossValueLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            profitLossValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            profitLossTitleLabel.centerYAnchor.constraint(equalTo: profitLossValueLabel.centerYAnchor, constant: 0),
            profitLossTitleLabel.trailingAnchor.constraint(equalTo: profitLossValueLabel.leadingAnchor, constant: -12)
        ])
    }
}

extension UserHoldingTableViewCell {
    func setupData(cellData: UserHolding?) {
        guard let cellData else { return }
        companyNameLabel.text = cellData.symbol
        netQuantityValueLabel.text = "\(cellData.quantity ?? 0)"
        ltpValueLabel.text = "₹ \(cellData.ltp ?? 0)"
        profitLossValueLabel.text = "₹ \(cellData.totalPNL ?? 0)"
        profitLossValueLabel.textColor = (cellData.totalPNL ?? 0) < 0 ? .red : .systemGreen
    }
}
