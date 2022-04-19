//
//  HealthStat.swift
//  LearningHealthKit
//
//  Created by Alberto Dominguez on 4/19/22.
//

import Foundation
import HealthKit

struct HealthStat {
    let id = UUID()
    let stat: HKQuantity?
    let date: Date
}
