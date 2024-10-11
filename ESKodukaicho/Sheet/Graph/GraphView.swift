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
                    CategoryView().navigationTitle("カテゴリ別の支出割合").interactiveDismissDisabled()
                }
                NavigationLink("期間ごとの支出・収入") {
                    EarningsPerPeriod().navigationTitle("期間ごとの支出・収入").interactiveDismissDisabled()
                }
                NavigationLink("収入と支出の内訳") {
                    BreakdownOfRevenue().navigationTitle("収入と支出の内訳").interactiveDismissDisabled()
                }
                NavigationLink("特定の支出傾向の発見") {
                    RevenueScatterPlot().navigationTitle("特定の支出傾向の発見").interactiveDismissDisabled()
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
