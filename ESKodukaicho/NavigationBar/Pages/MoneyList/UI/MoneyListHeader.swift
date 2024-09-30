//
//  MoneyListHeader.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/01.
//

import SwiftUI

struct MoneyListHeader: View {
    var body: some View {
        HStack {
            Text("10月").font(.largeTitle).bold().padding(.trailing)
            VStack {
                HStack{
                    Text("収入").font(.headline)
                    Spacer()
                    Text("300,000円")
                }
                Divider().background(Color.FTB_B)
                HStack{
                    Text("支出").font(.headline)
                    Spacer()
                    HStack(spacing: 0){
                        Text("-")
                        Text("10,000円")
                    }.foregroundStyle(.red)
                }
            }
        }
    }
}

#Preview {
    MoneyListHeader()
}
