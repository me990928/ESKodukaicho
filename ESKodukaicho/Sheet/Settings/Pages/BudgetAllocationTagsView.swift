//
//  BudgetAllocationTagsView.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/09.
//

import SwiftUI

struct BudgetAllocationTagsView: View {
    
    @State var isPresented: Bool = true
    @State var budget: String = ""
    
    var body: some View {
        ScrollView {
            VStack{
                
                HStack {
                    Button(action: {
//                        isOpenError.toggle()
                    }) {
                        Image(systemName: "chevron.left")
                    }
                    Spacer()
                    Text("2024/10")
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "chevron.right")
                    }
                }.font(.title2).bold()
                Divider()
                
                VStack{
//                    HStack{
//                        Text("予算総額")
//                        Spacer()
//                        Text("30000円")
//                    }.font(.headline)
                    MonthBudgetUI(budget: $budget).foregroundStyle(.white)
                    HStack{
                        Text("支出タグ")
                        Picker("支出タグ", selection: .constant("")) {
                            Text("未分類").tag("")
                            Text("交通費").tag("交通費")
                            Text("食費").tag("食費")
                            Text("衣服").tag("衣服")
                            Text("趣味").tag("趣味")
                        }
                        Spacer()
                    }.foregroundStyle(.white)
                }.padding().background(Color.main , in: RoundedRectangle(cornerRadius: 10))
                Button("追加") {}.buttonStyle(.borderedProminent).padding()
                
                BudgetAllocationTotal().padding(.bottom).foregroundStyle(.white)
                
                if isPresented {
                    // 表示するものがなければ非表示にする
                    VStack{
                        BudgetAllocationListItem()
                        BudgetAllocationListItem(label: "交通費")
                        BudgetAllocationListItem(label: "食費")
                        BudgetAllocationListItem(label: "衣類")
                        BudgetAllocationListItem(label: "趣味", budget: "1299")
                    }.padding().background(Color.main , in: RoundedRectangle(cornerRadius: 10)).foregroundStyle(.white)
                }
                
                Spacer()
            }
        }.scrollDismissesKeyboard(.immediately).padding().background(Color.base)
    }
}

#Preview {
    BudgetAllocationTagsView()
}

struct BudgetAllocationListItem: View {
    
    @State var label: String = "未分類"
    @State var budget: String = ""
    @FocusState var isFocused: Bool
    
    var body: some View {
        HStack{
            Text(label)
            Spacer()
            ZStack{
                TextField("円", text: $budget).focused($isFocused).multilineTextAlignment(.trailing).keyboardType(.decimalPad).onChange(of: isFocused) {
                    if isFocused && budget.last == "円" {
                        budget.removeLast()
                    }
                    if !budget.isEmpty && !isFocused {
                        budget = "\(budget)円"
                        print("test")
                    }
                }
                .onAppear() {
                    if !budget.isEmpty {
                        budget = "\(budget)円"
                    }
                }
            }
        }
    }
}

struct MonthBudgetUI: View {
    
    @FocusState var isFocused: Bool
    @Binding var budget: String
    
    var body: some View {
        HStack{
            Text("今月の予算")
            ZStack{
                TextField("円", text: $budget).focused($isFocused).multilineTextAlignment(.trailing).keyboardType(.decimalPad).onChange(of: isFocused) {
                    if isFocused && budget.last == "円" {
                        budget.removeLast()
                    }
                    if !budget.isEmpty && !isFocused {
                        budget = "\(budget)円"
                        print("test")
                    }
                }
            }
        }.font(.headline)
    }
}

struct BudgetAllocationTotal: View {
    var body: some View {
        VStack{
            HStack{
                Text("合計")
                Spacer()
                // 予算を超えたら赤色にする
                Text("100000円").foregroundStyle(.red)
            }.padding().font(.headline)
        }.background(Color.main , in: RoundedRectangle(cornerRadius: 10))
    }
}
