//
//  Int+Extension.swift
//  Eval_iOS_Steam
//
//  Created by Student07 on 25/10/2023.
//

import Foundation

extension Int {
    func toCurrency(currency: String) -> String {
        let price = Double(self)/100
        let result = "\(String(format: "%.2f", price)) \(currency)"
        return result
    }
}
