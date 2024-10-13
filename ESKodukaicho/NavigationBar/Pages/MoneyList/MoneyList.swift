//
//  MoneyList.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/09/29.
//

import SwiftUI

struct MoneyList: View {
    
    let tags = Array(repeating: "Tag", count: 9)
    
    
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    
                    MoneyListHeader().padding()
                    
                    Divider().padding(.horizontal)
                    
                    MoneySavingList().padding()
                    
                    Divider().padding(.horizontal)
                    
                    BudgetList().padding()
                    
                    Divider().padding(.horizontal)
                    
                    // PaymentList Start
                    PaymentsList().padding()
                    // PaymentList Start
                    
                }.frame(width: geometry.size.width)
                Spacer().frame(height: geometry.size.height / 4)
            }
        }
    }
}

#Preview {
    MoneyList()
}


