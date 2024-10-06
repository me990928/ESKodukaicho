//
//  Category.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/06.
//

import SwiftUI
import Charts

struct CategoryView: View {
    
    let data: [CategoryData] = [
        .init(tags: "ジュース", price: 1500, color: .red),
        .init(tags: "昼飯", price: 1200, color: .blue),
        .init(tags: "交通費", price: 1000, color: .green),
        .init(tags: "おやつ", price: 500, color: .yellow),
        .init(tags: "未分類", price: 1000, color: .gray),
    ]
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                }
                Spacer()
                Text("2024/10")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "chevron.right")
                }
            }.font(.title).bold()
            Divider()
            
            Chart(data, id: \.tags) { data in
                SectorMark(angle: .value("price", data.price), innerRadius: .ratio(0.5), outerRadius: .inset(50), angularInset: 1).foregroundStyle(data.color)
            }.frame(height: 300)
            
            ForEach(data, id: \.tags){ data in
                HStack {
                    Circle().frame(width: 10, height: 10).foregroundStyle(data.color)
                    Text("\(data.tags): \(data.price)円")
                    Spacer()
                }
            }
            Spacer()
        }.padding()
    }
}

#Preview {
    CategoryView()
}

struct CategoryData {
    var tags: String
    var price: Int
    var color: Color = .gray
}
