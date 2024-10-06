//
//  BarView.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/06.
//

import SwiftUI
import Charts

struct EarningsPerPeriod: View {
    
    @State var isOpenError: Bool = false
    
    let data: [BarData] = [
        .init(id: 0, month: "1", category: "収入", value: 10000),
        .init(id: 1, month: "1", category: "支出", value: 5000),
        .init(id: 2, month: "2", category: "収入", value: 12000),
        .init(id: 3, month: "2", category: "支出", value: 3000),
        .init(id: 4, month: "3", category: "収入", value: 15000),
        .init(id: 5, month: "3", category: "支出", value: 4000),
        .init(id: 6, month: "4", category: "収入", value: 18000),
        .init(id: 7, month: "4", category: "支出", value: 5000),
        .init(id: 8, month: "5", category: "収入", value: 20000),
        .init(id: 9, month: "5", category: "支出", value: 6000),
        .init(id: 10, month: "6", category: "収入", value: 13000),
        .init(id: 11, month: "6", category: "支出", value: 7000),
        .init(id: 12, month: "7", category: "収入", value: 14000),
        .init(id: 13, month: "7", category: "支出", value: 8000),
        .init(id: 14, month: "8", category: "収入", value: 16000),
        .init(id: 15, month: "8", category: "支出", value: 9000),
        .init(id: 16, month: "9", category: "収入", value: 17000),
        .init(id: 17, month: "9", category: "支出", value: 8500),
        .init(id: 18, month: "10", category: "収入", value: 19000),
        .init(id: 19, month: "10", category: "支出", value: 9500),
        .init(id: 20, month: "11", category: "収入", value: 21000),
        .init(id: 21, month: "11", category: "支出", value: 10000),
        .init(id: 22, month: "12", category: "収入", value: 22000),
        .init(id: 23, month: "12", category: "支出", value: 11000),
        .init(id: 24, month: "1", category: "貯金", value: 5000),
        .init(id: 25, month: "2", category: "貯金", value: 6000),
        .init(id: 26, month: "3", category: "貯金", value: 7000),
        .init(id: 27, month: "4", category: "貯金", value: 8000),
        .init(id: 28, month: "5", category: "貯金", value: 9000),
        .init(id: 29, month: "6", category: "貯金", value: 10000),
        .init(id: 30, month: "7", category: "貯金", value: 11000),
        .init(id: 31, month: "8", category: "貯金", value: 12000),
        .init(id: 32, month: "9", category: "貯金", value: 13000),
        .init(id: 33, month: "10", category: "貯金", value: 14000),
        .init(id: 34, month: "11", category: "貯金", value: 15000),
        .init(id: 35, month: "12", category: "貯金", value: 16000),
    ]
    
    var body: some View {
        VStack{
            HStack {
                Button(action: {
                    isOpenError.toggle()
                }) {
                    Image(systemName: "chevron.left")
                }
                Spacer()
                Text("2024")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "chevron.right")
                }
            }.font(.title).bold()
            Divider()
            
            ZStack {
                
                Chart(data, id: \.id) { data in
                    BarMark(
                        x: .value("month", data.month),
                        y: .value("value", data.value)
                    )
                    .foregroundStyle(by: .value("category", data.category))
                    .position(by: .value("category", data.category))
                }.frame(height: 300)
                    .chartScrollableAxes(.horizontal)
                    .chartXVisibleDomain(length: 12)
                    .padding(.vertical)
                
                if isOpenError {
                    Rectangle().fill(Color.clear).frame(height: 320).background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10)).overlay {
                        Text("2023年のデータが存在しません")
                    }
                }
                
            }
            
            VStack(alignment: .leading){
                Divider()
                Text("収入合計: 1999999円").font(.title2)
                Text("支出合計: 1999999円").font(.title2)
                Text("貯金合計: 1999999円").font(.title2)
            }
            
            Spacer()
        }.padding()
    }
}

#Preview {
                        EarningsPerPeriod()
}

struct BarData: Identifiable {
    var id: Int
    var month: String
    var category: String
    var value: Int
}
