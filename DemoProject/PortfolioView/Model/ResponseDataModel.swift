//
//  ResponseDataModel.swift
//  DemoProject
//
//  Created by Saurabh  Verma on 10/06/24.
//

import Foundation

struct ResponseDataModel: Codable {
    let data: UserData?
}

struct UserData: Codable {
    let userHolding: [UserHolding]?
}

struct UserHolding: Codable {
    let symbol: String?
    let quantity: Int?
    let ltp: Double?
    let avgPrice: Double?
    let close: Double?
    
    var currentVal: Double? {
        guard let lastTradedPrice = ltp, let quantityHolding = quantity else { return nil }
        return lastTradedPrice * Double(quantityHolding)
    }
    
    var totalInvestment: Double? {
        guard let avgPrice, let quantityHolding = quantity else { return nil }
        let totalInvestment = avgPrice * Double(quantityHolding)
        let stringValue = String(format: "%.2f", totalInvestment)
        return Double(stringValue)
    }
    
    var totalPNL: Double? {
        guard let currentVal, let totalInvestment else { return nil }
        let totalPNL = currentVal - totalInvestment
        let stringValue = String(format: "%.2f", totalPNL)
        return Double(stringValue)
    }
    
    var todayPNL: Double? {
        guard let close, let ltp, let quantity else { return nil }
        let todayProfitLoss = (close - ltp) * Double(quantity)
        return todayProfitLoss
    }
}
