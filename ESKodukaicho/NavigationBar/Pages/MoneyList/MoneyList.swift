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
                    
                    Divider().background(Color.FTB_B).padding(.horizontal)
                    
                    MoneySavingList().padding()
                    
                    Divider().background(Color.FTB_B).padding(.horizontal)
                    
                    VStack {
                        HStack{
                            Text("支出一覧").font(.headline)
                            Spacer()
                        }
                        VStack{
                            HStack{
                                Text("タグ一覧").font(.caption)
                                Spacer()
                            }.padding(5)
                            TagList().padding(.vertical)
                        }.background(Color.FTB_N, in: RoundedRectangle(cornerRadius: 10))
                        
                        VStack {
                            HStack{
                                Text("支出").font(.caption)
                                Spacer()
                            }.padding(5)
                            // ListItem
                            VStack {
                                PaymentList().padding(.bottom)
                                PaymentList().padding(.bottom)
                                PaymentList().padding(.bottom)
                                PaymentList().padding(.bottom)
                                PaymentList().padding(.bottom)
                            }.padding(.horizontal)
                        }.background(Color.FTB_N, in: RoundedRectangle(cornerRadius: 10))
                        
                    }.padding()
                    
                }.frame(width: geometry.size.width)
                Spacer().frame(height: geometry.size.height / 4)
            }
        }.background(Color.FTB_BK).foregroundStyle(.white)
    }
}

#Preview {
    MoneyList()
}


