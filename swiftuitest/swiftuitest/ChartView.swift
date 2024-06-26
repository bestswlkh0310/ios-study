//
//  Charts.swift
//  swiftuitest
//
//  Created by dgsw8th71 on 4/8/24.
//

import SwiftUI
import Charts

let curColor = Color(0x2597FF)
let curColorBg = LinearGradient(
    colors: [
        curColor.opacity(0.4),
        curColor.opacity(0)
    ],
    startPoint: .top,
    endPoint: .bottom
)

let weekLst = ["7/3", "7/4", "7/5", "7/6", "7/7", "7/8", "7/9"]

let cur1Color = Color(0xFF8125)
let cur1ColorBg = LinearGradient(
    colors: [
        cur1Color.opacity(0.4),
        cur1Color.opacity(0)
    ],
    startPoint: .top,
    endPoint: .bottom
)

extension Color {
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
let arr1 = (0..<7).map { _ in Int.random(in: 1..<30) }
let arr2 = (0..<7).map { _ in Int.random(in: 1..<30) }

struct ChartView: View {
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Chart(0..<7, id: \.self) { i in
                    let y = arr2[i]
                    LineMark(
                        x: .value("", i),
                        y: .value("", y)
                    )
                    .lineStyle(.init(lineWidth: 3, lineCap: .round, lineJoin: .round))
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(cur1Color)
                    AreaMark(
                        x: .value("", i),
                        y: .value("", y)
                    )
                    .lineStyle(.init(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(cur1ColorBg)
                }
                .chartXAxis {
                    AxisMarks { axis in
                        let value = weekLst[axis.index]
                        AxisValueLabel("\(value)", centered: false)
                            .foregroundStyle(.black)
                    }
                }
                .chartYAxis {
                    AxisMarks(
                        format: .number,
                        values: [10, 20, 30]
                    )
                }
                Chart(0..<7, id: \.self) { i in
                    let y = arr1[i]
                    LineMark(
                        x: .value("", i),
                        y: .value("", y)
                    )
                    .lineStyle(.init(lineWidth: 3, lineCap: .round, lineJoin: .round))
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(curColor)
                    AreaMark(
                        x: .value("", i),
                        y: .value("", y)
                    )
                    .lineStyle(.init(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(curColorBg)
                }
//                .chartXAxis(.hidden)
                .chartLegend(.hidden)
                .chartXAxis {
                    AxisMarks { axis in
                        let value = weekLst[axis.index]
                        AxisValueLabel("\(value)", centered: false)
                    }
                }
                .chartYAxis {
                    AxisMarks(
                        format: .number,
                        values: [10, 20, 30]
                    )
                }
            }
            .frame(height: 300)
            Spacer()
        }
    }
}
