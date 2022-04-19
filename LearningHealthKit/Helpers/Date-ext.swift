//
//  Date-ext.swift
//  LearningHealthKit
//
//  Created by Alberto Dominguez on 4/19/22.
//

import Foundation

extension Date {
    static var today: Date {
        return Date()
    }
    
    static var lastWeeksDate: Date {
        return Calendar.current.date(byAdding: .day, value: -7, to: Date())!
    }
    
    static func mondayAt12AM() -> Date {
        return Calendar(identifier: .iso8601).date(from: Calendar(identifier: .iso8601).dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))!
    }
}
