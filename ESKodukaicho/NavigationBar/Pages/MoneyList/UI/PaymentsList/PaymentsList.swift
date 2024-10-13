//
//  PaymentList.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/13.
//

import SwiftUI

struct PaymentsList: View {
    
    @State var isPresentedPaymentList: Bool = false
    @State var isExpandedPaymentList: Bool = false
    
    var body: some View {
        VStack {
            HStack{
                Text("収支一覧").font(.headline)
                Spacer()
                Image(systemName: "chevron.down").font(.caption).rotationEffect(.degrees(isPresentedPaymentList ? 180 : 0))
            }.contentShape(Rectangle()).onTapGesture {
                withAnimation(.easeIn(duration: 0.2)) {
                    isPresentedPaymentList.toggle()
                    isExpandedPaymentList.toggle()
                }
                
            }
            
            
            if isExpandedPaymentList {
                VStack{
                    HStack{
                        Text("タグ一覧").font(.caption).foregroundStyle(.white)
                        Spacer()
                    }.padding(5)
                    TagList().padding(.vertical)
                }.background(Color.main, in: RoundedRectangle(cornerRadius: 10))
                
                VStack {
                    HStack{
                        Text("収支").font(.caption).foregroundStyle(.white)
                        Spacer()
                    }.padding(5)
                    // ListItem
                    VStack {
//                        PaymentListItemに名前を変更予定
                        PaymentList1().padding(.bottom)
                        PaymentList2().padding(.bottom)
                        PaymentList1().padding(.bottom)
                        PaymentList2().padding(.bottom)
                        PaymentList1().padding(.bottom)
                    }.padding(.horizontal)
                }.background(Color.main, in: RoundedRectangle(cornerRadius: 10))
            }
            
        }
    }
}

#Preview {
    PaymentsList()
}
