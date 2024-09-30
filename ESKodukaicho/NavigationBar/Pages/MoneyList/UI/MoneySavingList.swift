//
//  MoneySavingList.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/01.
//

import SwiftUI

struct MoneySavingList: View {
    var body: some View {
        VStack{
            HStack{
                Text("貯金一覧").font(.headline)
                Spacer()
            }
            
            MoneySavingItem(tagName: "財布", tagColor: .red, money: 10000)
            MoneySavingItem(tagName: "UFJ", tagColor: .blue, money: 10000)
            MoneySavingItem(tagName: "引越し費用", tagColor: .yellow, money: 50000)
            MoneySavingItem(tagName: "繰越", tagColor: .black, money: 1000)
            
        }
    }
}

#Preview {
    MoneySavingList()
}
