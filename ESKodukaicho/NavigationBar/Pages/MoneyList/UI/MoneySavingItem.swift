//
//  MoneySavingItem.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/01.
//

import SwiftUI

struct MoneySavingItem: View {
    @State var tagName: String
    @State var tagColor: Color
    @State var money: Int
    
    init(tagName: String, tagColor: Color, money: Int) {
        
        if tagName.isEmpty {
            self.tagName = "未分類"
        } else {
            self.tagName = tagName
        }
        
        self.tagColor = tagColor
        self.money = money
    }
    
    var body: some View {
                HStack{
                    ListTag(tagName: tagName, tagColor: tagColor, isActive: true).disabled(true)
                    Spacer()
                    Text("\(money)円")
                }
        //        HStack{
        //            ListTag(tagName: tagName, tagColor: tagColor).disabled(true)
        //            Text("+\(money)円")
        //            Spacer()
        //            Text("合計 30,0000円")
        //        }
//        Grid {
//            GridRow {
//                ListTag(tagName: tagName, tagColor: tagColor).disabled(true)
//                Text("+\(money)円")
//                Text("合計 30,0000円")
//            }
//        }
    }
}

#Preview {
    MoneySavingItem(tagName: "", tagColor: .red, money: 1000)
}
