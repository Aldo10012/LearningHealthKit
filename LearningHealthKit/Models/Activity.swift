//
//  Activity.swift
//  LearningHealthKit
//
//  Created by Alberto Dominguez on 4/19/22.
//

import Foundation

struct Activity {
    var id: String
    var name: String
    var image: String
    
    static func allActivities() -> [Activity] {
        return [
            Activity(id: "activeEnergyBurned", name: "Active Burned Calories", image: "⚡️"),
            Activity(id: "appleExerciseTime", name: "Exercise Time", image: "🕙"),
            Activity(id: "appleStandTime", name: "Stand Time", image: "🕴🏻"),
            Activity(id: "distanceWalkingRunning", name: "Distance Walking/Running", image: "🏃🏻"),
            Activity(id: "stepCount", name: "Step Count", image: "👞")
        
        ]
    }
}
