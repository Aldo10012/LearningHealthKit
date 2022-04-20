//
//  DetailView.swift
//  LearningHealthKit
//
//  Created by Alberto Dominguez on 4/19/22.
//

import SwiftUI

struct DetailView: View {
    
    var activity: Activity
    var repository: HKRepository
    @ObservedObject var viewModel: DetailViewModel
    
    init(activity: Activity, repository: HKRepository) {
        self.activity = activity
        self.repository = repository
        
        viewModel = DetailViewModel(actiity: activity, repository: repository)
    }
    
    var body: some View {
        ChartView(
            values: viewModel.stats.map{viewModel.value(for: $0.stat).value},
            labels: viewModel.stats.map{viewModel.value(for: $0.stat).desc},
            xAxisLabel: viewModel.stats.map{DetailViewModel.dateFormatter.string(from: $0.date)}
        )
        
        List(viewModel.stats, id: \.id) { stat in
            VStack(alignment: .leading) {
                Text(viewModel.value(for: stat.stat).desc)
                Text(stat.date, style: .date).opacity( 0.5)
            }
        }
        .navigationTitle("\(activity.name) \(activity.image)")
        .navigationBarTitleDisplayMode(.inline)
                  
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let activity = Activity(id: "activeEnergyBurned", name: "Active Burned Calories", image: "⚡️")
        
        DetailView(activity: activity, repository: HKRepository())
    }
}
