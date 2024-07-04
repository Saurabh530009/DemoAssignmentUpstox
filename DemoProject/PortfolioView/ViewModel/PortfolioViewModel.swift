//
//  ViewControllerViewModel.swift
//  DemoProject
//
//  Created by Saurabh  Verma on 10/06/24.
//

import Foundation

// MARK: - Properties
class PortfolioViewModel {
    private var userHolding: [UserHolding]?
    var chevronBtnTapped: Bool = false
}
// MARK: - Methods
extension PortfolioViewModel {
    func getNumberOfCells() -> Int {
        return (userHolding ?? []).count
    }
    func getCellData(forIndex: Int) -> UserHolding? {
        guard let cellData = userHolding?[safe: forIndex] else { return nil }
        return cellData
    }
    func getTotalCurrentValue() -> Double {
        guard let userHolding else { return 0.0 }
        return userHolding.reduce(0.0) { $0 + ($1.currentVal ?? 0.0) }
    }
    func getTotalInvestment() -> Double {
        guard let userHolding else { return 0.0 }
        return userHolding.reduce(0.0) { $0 + ($1.totalInvestment ?? 0.0) }
    }
    func getTotalPNL() -> Double {
        guard let userHolding else { return 0.0 }
        return userHolding.reduce(0.0) { $0 + ($1.totalPNL ?? 0.0) }
    }
    func getTodayPNL() -> Double {
        guard let userHolding else { return 0.0 }
        return userHolding.reduce(0.0) { $0 + ($1.todayPNL ?? 0.0) }
    }
    func getPercentageProfitLoss() -> Double {
        let totalCurrent = getTotalCurrentValue()
        let totalInvestment = getTotalInvestment()
        let lossProfitPercentage = (totalCurrent - totalInvestment) / totalInvestment
        let stringValue = String(format: "%.2f", lossProfitPercentage)
        return Double(stringValue) ?? 0.0
    }
}
// MARK: - Network Call And Data Parsing
extension PortfolioViewModel {
    func fetchData(completion: (() -> Void)?) {
        guard let url = URL(string: StringConstants.urlString) else {
            debugPrint("Invalid Url")
            return
        }
        
        URLSession.shared.fetchData(url: url, decodeType: ResponseDataModel.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.userHolding = response.data?.userHolding
                debugPrint(response)
                completion?()
            case .failure(let error):
                debugPrint("Error fetching data: \(error.localizedDescription)")
            }
        }
    }
}
