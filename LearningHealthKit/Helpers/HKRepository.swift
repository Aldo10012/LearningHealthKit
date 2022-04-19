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
    
    let allTypes = Set([
        HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
        HKObjectType.quantityType(forIdentifier: .appleExerciseTime)!,
        HKObjectType.quantityType(forIdentifier: .appleStandTime)!,
        HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
        HKObjectType.quantityType(forIdentifier: .stepCount)!
    ])
    
    var query: HKStatisticsQuery?
    
    init() {
        store = HKHealthStore()
    }
    
    
    func requestAuthorization(_ completion: @escaping (Bool) -> ()) {
        guard let store = store else {
            return
        }
        
        store.requestAuthorization(toShare: [], read: allTypes) { success, error in
            completion(success)
        }
    }
}
