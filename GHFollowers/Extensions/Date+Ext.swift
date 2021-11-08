//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Mine Rala on 9.11.2021.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
