//
//  BudgetList.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/13.
//

import SwiftUI

struct BudgetList: View {
    
    @State var isPresentedBudgetList: Bool = false
    @State var isExpandedBudgetList: Bool = false

    var body: some View {
        VStack {
            HStack{
                Text("予算一覧").font(.headline)
                Spacer()
                Image(systemName: "chevron.down").font(.caption).rotationEffect(.degrees(isPresentedBudgetList ? 180 : 0))
            }.contentShape(Rectangle()).onTapGesture {
                withAnimation(.easeIn(duration: 0.2)) {
                    isPresentedBudgetList.toggle()
                    isExpandedBudgetList.toggle()
                }
                
            }
            
            if isExpandedBudgetList {
                VStack{
                    MoneyTagPriceItem(tagName: "衣類", tagColor: .cyan, money: 3000)
                    MoneyTagPriceItem(tagName: "食費", tagColor: .orange, money: 3000)
                    MoneyTagPriceItem(tagName: "趣味", tagColor: .red, money: 3000)
                }.padding().background(Color.main, in: RoundedRectangle(cornerRadius: 10)).foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    BudgetList()
}
