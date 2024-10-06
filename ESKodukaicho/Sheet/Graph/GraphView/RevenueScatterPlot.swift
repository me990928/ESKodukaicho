//
//  RevenueScatterPlot.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/07.
//

import SwiftUI
import Charts

struct RevenueScatterPlot: View {
    
    let data: [RevenueScatterPlotDate] = [
        .init(tag: "ジュース", tagMonthPrice: 2000, allMonthPrice: 10000, color: .blue),
        .init(tag: "昼食", tagMonthPrice: 4000, allMonthPrice: 10000, color: .red),
        .init(tag: "交通費", tagMonthPrice: 1200, allMonthPrice: 10000, color: .green),
        .init(tag: "未分類", tagMonthPrice: 2800, allMonthPrice: 10000, color: .yellow),
        .init(tag: "ジュース", tagMonthPrice: 1000, allMonthPrice: 15000, color: .blue),
        .init(tag: "昼食", tagMonthPrice: 2000, allMonthPrice: 15000, color: .red),
        .init(tag: "交通費", tagMonthPrice: 5000, allMonthPrice: 15000, color: .green),
        .init(tag: "未分類", tagMonthPrice: 2800, allMonthPrice: 15000, color: .yellow),
    ]
    
    let tags: [Tags] = [
        .init(id: UUID().uuidString, name: "ジュース", color: .blue),
        .init(id: UUID().uuidString, name: "昼食", color: .red),
        .init(id: UUID().uuidString, name: "交通費", color: .green),
        .init(id: UUID().uuidString, name: "未分類", color: .yellow),
    ]
    
    var body: some View {
        VStack {
            HStack{
                Chart(data.indices, id: \.self) { index in
                    PointMark(
                        x: .value("タグの月間支出", data[index].tagMonthPrice),
                        y: .value("月間の支出", data[index].allMonthPrice)
                    ).foregroundStyle(data[index].color)
                }.frame(height: 300)
            }
            
            HStack {
                FlowLayout(alignment: .leading, spacing: 5) {
                    
                    ForEach(tags, id: \.id) { tag in
                        HStack {
                            Circle().fill(tag.color).frame(width: 10, height: 10)
                            Text(tag.name).font(.footnote).foregroundStyle(.gray)
                        }
                    }
                }
                Spacer()
            }
            
            HStack{
                Text("縦軸を月の支出、横軸をタグの月の支出としています").font(.caption).foregroundStyle(.gray)
                Spacer()
            }
            Spacer()
        }.padding()
    }
}

#Preview {
    RevenueScatterPlot()
}

struct RevenueScatterPlotDate {
    var tag: String = "未分類"
    var tagMonthPrice: Int = 0
    var allMonthPrice: Int = 0
    var color: Color = .gray
}
