//
//  MoneyList.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/09/29.
//

import SwiftUI

struct MoneyList: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("MoneyList")
            }.frame(width: geometry.size.width).background(.green)
        }
    }
}

#Preview {
    MoneyList()
}
