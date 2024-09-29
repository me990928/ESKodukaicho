//
//  CalendarView.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/09/29.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("CalendarView")
            }.frame(width: geometry.size.width).background(.cyan)
        }
    }
}

#Preview {
    CalendarView()
}
