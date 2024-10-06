//
//  LineView.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/07.
//

import SwiftUI
import Charts

struct BreakdownOfRevenue: View {
    
    @State var isOpenError: Bool = false
    
    let revenues: [RevenueDate] = [
        .init(id: 0, category: "収入", price: 40000, tag: "アルバイト", color: .red),
        .init(id: 0, category: "収入", price: 10000, tag: "お小遣い", color: .green),
        .init(id: 1, category: "支出", price: 3000, tag: "ジュース", color: .blue),
        .init(id: 1, category: "支出", price: 3000, tag: "ジュース", color: .blue),
        .init(id: 1, category: "支出", price: 6000, tag: "交通費", color: .yellow),
        .init(id: 1, category: "支出", price: 10000, tag: "昼食", color: .orange),
        .init(id: 1, category: "支出", price: 4000, tag: "飲み会", color: .purple),
        .init(id: 2, category: "貯金", price: 100000)
    ]
    
    let tags: [Tags] = [
        .init(id: UUID().uuidString, name: "アルバイト", color: .red),
        .init(id: UUID().uuidString, name: "お小遣い", color: .green),
        .init(id: UUID().uuidString, name: "ジュース", color: .blue),
        .init(id: UUID().uuidString, name: "交通費", color: .yellow),
        .init(id: UUID().uuidString, name: "昼食", color: .orange),
        .init(id: UUID().uuidString, name: "飲み会", color: .purple),
        .init(id: UUID().uuidString, name: "未分類", color: .gray)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    isOpenError.toggle()
                }) {
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
            
            ZStack {
                Chart(revenues, id: \.id) { data in
                    BarMark(
                        x: .value("price", data.price),
                        y: .value("タグ", data.category)
                    ).foregroundStyle(data.color)
                }.frame(height: 300).padding(.vertical)
                
                
                if isOpenError {
                    Rectangle().fill(Color.clear).frame(height: 200).background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10)).overlay {
                        Text("2024年9月のデータが存在しません")
                    }
                }
            }
            
            VStack{
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
            }
            
            Spacer()
        }.padding()
    }
}

#Preview {
    BreakdownOfRevenue()
}

struct RevenueDate: Identifiable {
    var id: Int
    var category: String
    var price: Int
    var tag: String = "未分類"
    var color: Color = .gray
}

struct Tags: Identifiable {
    var id: String
    var name: String
    var color: Color
}
