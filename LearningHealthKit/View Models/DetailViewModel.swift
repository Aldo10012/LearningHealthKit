//
//  DetailViewModel.swift
//  LearningHealthKit
//
//  Created by Alberto Dominguez on 4/19/22.
//

import Foundation
import HealthKit

class DetailViewModel: ObservableObject {
    
    var activity: Activity
    var repository: HKRepository
    
    @Published var stats = [HealthStat]()
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter
    }()
    
    init(actiity: Activity, repository: HKRepository) {
        self.activity = actiity
        self.repository = repository
        repository.requestHealthStat(by: actiity.id) { [weak self] stats in
            self?.stats = stats
        }
    }
    
    let measurementFormatter = MeasurementFormatter()
    
    func value(for stat: HKQuantity?) -> (value: Int, desc: String) {
        guard let stat = stat else { return (0, "") }
        
        measurementFormatter.unitStyle = .long
        
        if stat.is(compatibleWith: .kilocalorie()) {
            let value = stat.doubleValue(for: .kilocalorie())
            return (Int(value), stat.description)
        }
        else if stat.is(compatibleWith: .meter()) {
            let value = stat.doubleValue(for: .mile())
            let unit = Measurement(value: value, unit: UnitLength.miles)
            return (Int(value), measurementFormatter.string(from: unit))
        }
        else if stat.is(compatibleWith: .count()) {
            let value = stat.doubleValue(for: .count())
            return (Int(value), stat.description)
        }
        else if stat.is(compatibleWith: .minute()) {
            let value = stat.doubleValue(for: .minute())
            return (Int(value), stat.description)
        }
        
        return (0, "")
    }
    
}
