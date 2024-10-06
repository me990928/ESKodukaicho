//
//  GraphView.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/05.
//

import SwiftUI

// 表示したいもの
// タグごとの割合を確認する
// タグごとのデータを表示する
// 年単位は収入と支出の比較
// 月単位はタグごとの支出
// 貯金の推移
// NavigationStackでページを随時増やすのが良さそう？

struct GraphView: View {
    var body: some View {
        NavigationSplitView {
            List{
                NavigationLink("カテゴリ別の支出割合") {
                    Text("支出の分析")
                }
                NavigationLink("期間ごとの支出・収入") {
                    Text("収入と支出の分析")
                }
                NavigationLink("収入と支出の推移") {
                    Text("タグの分析")
                }
                NavigationLink("収入と支出の内訳") {
                    Text("タグの分析")
                }
                NavigationLink("特定の支出傾向の発見") {
                    Text("タグの分析")
                }
                NavigationLink("支出の頻度") {
                    Text("タグの分析")
                }
            }.navigationTitle("分析")
        } detail: {
            Text("Not selected")
        }
    }
}

#Preview {
    GraphView()
}
