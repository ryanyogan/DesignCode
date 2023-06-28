//
//  ChartView.swift
//  DesignCode
//
//  Created by Ryan Yogan on 6/28/23.
//

import SwiftUI
import Charts

struct ChartView: View {
    var body: some View {
        Chart {
            ForEach(data) { item in
                LineMark(x: .value("Day", item.day), y: .value("Value", item.value), series: .value("Year", "2023"))
                    .cornerRadius(10)
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(by: .value("Year", "2023"))
                    .symbol(by: .value("Year", "2023"))
            }
            ForEach(data2) { item in
                LineMark(x: .value("Day", item.day), y: .value("Value", item.value), series: .value("Year", "2022"))
                    .cornerRadius(10)
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(by: .value("Year", "2022"))
                    .symbol(by: .value("Year", "2022"))
            }
        }
        .foregroundStyle(.linearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom))
        .frame(height: 300)
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}


struct Value: Identifiable {
    var id = UUID()
    var day: String
    var value: Double
}

let data = [
    Value(day: "June 1", value: 200),
    Value(day: "June 2", value: 300),
    Value(day: "June 3", value: 100),
    Value(day: "June 4", value: 500),
    Value(day: "June 5", value: 600),
]
let data2 = [
    Value(day: "June 1", value: 100),
    Value(day: "June 2", value: 400),
    Value(day: "June 3", value: 200),
    Value(day: "June 4", value: 200),
    Value(day: "June 5", value: 200),
]
