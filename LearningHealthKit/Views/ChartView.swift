//
//  ChartView.swift
//  LearningHealthKit
//
//  Created by Alberto Dominguez on 4/19/22.
//

import SwiftUI

struct ChartView: View {
    
    let values: [Int]
    let labels: [String]
    let xAxisLabel: [String]
    
    var body: some View {
        GeometryReader { geo in
            HStack(alignment: .bottom) {
                ForEach(0..<values.count) { i in
                    let max = values.max() ?? 0
                    
                    VStack() {
                        Text(labels[i])
                            .font(.callout)
                            .rotationEffect(.degrees(-60))
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.orange)
                            .frame(
                                width: 20,
                                height: CGFloat(values[i]) / CGFloat(max) * geo.size.height * 0.6
                            )
                        
                        Text(xAxisLabel[i])
                            .font(.caption)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.primary.opacity(0.2))
            .cornerRadius(10)
            .padding(.bottom, 20)
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        let value = [200, 200, 100, 10, 200]
        let labels = ["200", "200", "10", "10", "200"]
        let xAxisLabel = ["May 1", "May 2", "May 3", "May 4", "May 5"]
        
        ChartView(values: value, labels: labels, xAxisLabel: xAxisLabel)
    }
}
