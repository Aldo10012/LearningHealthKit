//
//  HKRepository.swift
//  LearningHealthKit
//
//  Created by Alberto Dominguez on 4/19/22.
//

import Foundation
import HealthKit

final class HKRepository {
    var store: HKHealthStore?
    var query: HKStatisticsCollectionQuery?
        
    init() {
        if HKHealthStore.isHealthDataAvailable() {
             self.store = HKHealthStore()
        }
    }
    
    func requestAuthorization(_ completion: @escaping (Bool) -> ()) {
        guard let store = store else {
            return
        }
        
        store.requestAuthorization(toShare: [], read: HealthType.allTypes) { success, error in
            completion(success)
        }
    }
    
    func requestHealthStat(by category: String, completion: @escaping ([HealthStat]) -> ()) {
        guard let store = store, let type = HealthType.getType(for: category) else {
            return
        }
        
        var healthStats = [HealthStat]()
        
        let startData = Date.lastWeeksDate
        let endDate = Date.today
        let anchorDate = Date.mondayAt12AM()
        let daily = DateComponents(day: 1)
        
        let predicate = HKQuery.predicateForSamples(withStart: startData, end: endDate, options: .strictStartDate)
        
        query = HKStatisticsCollectionQuery(quantityType: type, quantitySamplePredicate: predicate, options: .cumulativeSum, anchorDate: anchorDate, intervalComponents: daily)
        
        query?.initialResultsHandler = { query, statistics, error in
            statistics?.enumerateStatistics(from: startData, to: endDate, with: { stats, _ in
                let stat = HealthStat(stat: stats.sumQuantity(), date: stats.startDate)
                healthStats.append(stat)
            })
            
            completion(healthStats)
        }
        
        guard let query = query else {
            return
        }
        
        store.execute(query)
    }
    
}
