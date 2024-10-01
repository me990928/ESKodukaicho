//
//  PaymentList.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/01.
//

import SwiftUI

struct PaymentList1: View {
    
    @State var isPresented: Bool = false
    @State var isExpanded: Bool = false
    
    var body: some View {
        VStack(spacing: 0){
            HStack {
                VStack{
                    HStack{
                        Text("2024/10/01").font(.caption)
                        Spacer()
                    }
                    HStack{
                        Text("貯金").font(.headline)
                        Spacer()
                    }
                }
                Spacer()
                VStack{
                    HStack(spacing: 0){
                        Text("+")
                        Text("1000円").padding(.trailing, 5).foregroundStyle(.white)
                        Image(systemName: "chevron.down").font(.caption).rotationEffect(.degrees(isPresented ? 180 : 0))
                    }.font(.headline)
                }
            }.padding(.vertical).contentShape(Rectangle()).onTapGesture {
                withAnimation {
                    isPresented.toggle()
                }
                
                isExpanded.toggle()
            }
            if isExpanded {
                VStack{
                    HStack {
                        Text("メモ").font(.caption)
                        Spacer()
                        Button(action: {
                            // 編集内容
                            // タグ、メモ、タイトル等
                        }) {
                            Image(systemName: "square.and.pencil")
                        }.padding(3)
                    }
                    HStack{
                        Text("メモの内容を書き込んで下さいメモの内容を書き込んで下さいメモの内容を書き込んで下さい\n(最大N文字)")
                        Spacer()
                    }
                }.padding().background(Color.FTB_BK, in: RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}

#Preview {
    PaymentList1()
}

//
//  PaymentList.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/01.
//

struct PaymentList2: View {
    
    @State var isPresented: Bool = false
    @State var isExpanded: Bool = false
    
    var body: some View {
        VStack(spacing: 0){
            HStack {
                VStack{
                    HStack{
                        Text("2024/10/01").font(.caption)
                        Spacer()
                    }
                    HStack{
                        Text("支出").font(.headline)
                        Spacer()
                    }
                }
                Spacer()
                VStack{
                    HStack(spacing: 0){
                        Text("-")
                        Text("1000円").padding(.trailing, 5).foregroundStyle(.red)
                        Image(systemName: "chevron.down").font(.caption).rotationEffect(.degrees(isPresented ? 180 : 0))
                    }.font(.headline)
                }
            }.padding(.vertical).contentShape(Rectangle()).onTapGesture {
                withAnimation {
                    isPresented.toggle()
                }
                
                isExpanded.toggle()
            }
            if isExpanded {
                VStack{
                    HStack {
                        Text("メモ").font(.caption)
                        Spacer()
                        Button(action: {
                            // 編集内容
                            // タグ、メモ、タイトル等
                        }) {
                            Image(systemName: "square.and.pencil")
                        }.padding(3)
                    }
                    HStack{
                        Text("メモの内容を書き込んで下さいメモの内容を書き込んで下さいメモの内容を書き込んで下さい\n(最大N文字)")
                        Spacer()
                    }
                }.padding().background(Color.FTB_BK, in: RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}

#Preview {
    PaymentList2()
}
//
//  PaymentList.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/01.
//

struct PaymentList3: View {
    
    @State var isPresented: Bool = false
    @State var isExpanded: Bool = false
    
    var body: some View {
        VStack(spacing: 0){
            HStack {
                VStack{
                    HStack{
                        Text("2024/10/01").font(.caption)
                        Spacer()
                    }
                    HStack{
                        Text("支出").font(.headline)
                        Spacer()
                    }
                }
                Spacer()
                VStack{
                    HStack(spacing: 0){
                        Text("-")
                        Text("1000円").padding(.trailing, 5).foregroundStyle(.red)
                        Image(systemName: "chevron.down").font(.caption).rotationEffect(.degrees(isPresented ? 180 : 0))
                    }.font(.headline)
                }
            }.padding(.vertical).contentShape(Rectangle()).onTapGesture {
                withAnimation {
                    isPresented.toggle()
                }
                
                isExpanded.toggle()
            }
            if isExpanded {
                VStack{
                    HStack {
                        Text("メモ").font(.caption)
                        Spacer()
                        Button(action: {
                            // 編集内容
                            // タグ、メモ、タイトル等
                        }) {
                            Image(systemName: "square.and.pencil")
                        }.padding(3)
                    }
                    HStack{
                        Text("メモの内容を書き込んで下さいメモの内容を書き込んで下さいメモの内容を書き込んで下さい\n(最大N文字)")
                        Spacer()
                    }
                }.padding().background(Color.FTB_BK, in: RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}

#Preview {
    PaymentList3()
}
