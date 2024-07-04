//
//  PortfolioViewController+Data.swift
//  DemoProject
//
//  Created by Saurabh  Verma on 12/06/24.
//

import UIKit

// MARK: - Update SubViews Data
extension PortfolioViewController {
    func updateSubViewsData() {
        UIView.animateTransition(on: self.tableView, duration: 1.0) { [weak self] in
            self?.tableView.reloadData()
        }
        
        UIView.animateTransition(on: profitLossBottomView, duration: 1.0) { [weak self] in
            self?.updateProfitLossViewData()
        }
        
        UIView.animateTransition(on: investmentDetailsView, duration: 1.0) { [weak self] in
            self?.updateInvestmentViewData()
        }
    }
    private func updateProfitLossViewData() {
        self.profitLossBottomView.setupData(profitLossVal: viewModel.getTotalPNL(),
                                            pecentageProfitLoss: abs(viewModel.getPercentageProfitLoss()))
    }
    private func updateInvestmentViewData() {
        self.investmentDetailsView.setupData(currentValue: viewModel.getTotalCurrentValue(),
                                             totalInvestment: viewModel.getTotalInvestment(),
                                             todayProfitLoss: viewModel.getTotalPNL())
    }
}
