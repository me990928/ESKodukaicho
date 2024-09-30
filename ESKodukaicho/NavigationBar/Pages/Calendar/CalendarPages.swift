//
//  CalendarPages.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/09/30.
//

import SwiftUI

struct CalendarPages: View {
    @State var currentDate = Date()
    var body: some View {
        GeometryReader{ geometry in
            VStack(spacing: 0){
                CalendarView(currentDate: currentDate).background(in: RoundedRectangle(cornerRadius: 10)).padding(EdgeInsets(top: 1, leading: 13, bottom: 0, trailing: 13))
                VStack(alignment: .leading) {
                    HStack{
                        Text("支出：")
                        Spacer()
                        Text("2,000円")
                    }
                    Divider().background(Color.FTB_N)
                    HStack{
                        Text("収入：")
                        Spacer()
                        Text("2,000円")
                    }
                    Divider().background(Color.FTB_N)
                    HStack{
                        Text("差引額：")
                        Spacer()
                        Text("0円")
                    }
                    Divider().background(Color.FTB_N)
                    Spacer()
                }.frame(height: geometry.size.height - 340).padding().font(.title3).foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    CalendarPages()
}
