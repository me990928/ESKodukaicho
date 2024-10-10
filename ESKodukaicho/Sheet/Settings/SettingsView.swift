//
//  SettingsView.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/07.
//

import SwiftUI

struct SettingsView: View {
    
    @State var monthStartDay: Int = 1
    @State var isDeleteAll: Bool = false
    
    var body: some View {
        NavigationSplitView {
            List{
                Section(header: Text("カレンダー")) {
                    Picker("月の開始日", selection: $monthStartDay) {
                        ForEach(1..<32) { day in
                            Text("\(day)日").tag(day)
                        }
                    }
                }
                
                Section(header: Text("収支")) {
                    NavigationLink("収支の入力通知") {
                        OptionNotificationView().navigationTitle("収支の入力通知")
                    }
                    NavigationLink("タグへの予算割") {
                        BudgetAllocationTagsView().navigationTitle("タグへの予算割")
                    }
                    NavigationLink("収支メモ一覧") {
                        
                    }
                }
                
                Section(header: Text("システム")) {
                    Button("収支のリセット", role: .destructive){
                        isDeleteAll.toggle()
                    }
                }.alert("全ての収支を削除しますか？", isPresented: $isDeleteAll) {
                    Button("キャンセル", role: .cancel){}
                    Button("削除する", role: .destructive){
                        print("delete all")
                    }
                } message: {
                    Text("削除したデータを復元することはできません。")
                }
            }.navigationTitle("設定")
        } detail: {
            Text("No selection")
        }
    }
}

#Preview {
    SettingsView()
}
