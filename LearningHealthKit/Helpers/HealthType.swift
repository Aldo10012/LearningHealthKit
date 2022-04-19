//
//  HealthType.swift
//  LearningHealthKit
//
//  Created by Alberto Dominguez on 4/19/22.
//

import Foundation
import HealthKit

final class HealthType {
    static func getType(of type: HKQuantityTypeIdentifier) -> HKQuantityType {
        return HKQuantityType.quantityType(forIdentifier: type)!
    }
    
    static let allTypes = Set([
        HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
        HKObjectType.quantityType(forIdentifier: .appleExerciseTime)!,
        HKObjectType.quantityType(forIdentifier: .appleStandTime)!,
        HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
        HKObjectType.quantityType(forIdentifier: .stepCount)!
    ])
    
    static func getType(for category: String) -> HKQuantityType? {
        return HKObjectType.quantityType(forIdentifier: HealthType().typeByCategory(category))
    }
    
    private func typeByCategory(_ category: String) -> HKQuantityTypeIdentifier {
        switch category {
        case "activeEnergyBurned":
            return .activeEnergyBurned
        case "appleExerciseTime":
            return .appleExerciseTime
        case "appleStandTime":
            return .appleStandTime
        case "distanceWalkingRunning":
            return .distanceWalkingRunning
        case "stepCount":
            return .stepCount
            
        default:
            return .stepCount
        }
    }
}

