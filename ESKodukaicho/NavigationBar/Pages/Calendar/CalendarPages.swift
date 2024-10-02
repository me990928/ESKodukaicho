//
//  CalendarPages.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/09/30.
//

import SwiftUI

struct CalendarPages: View {
    @State var calendarModel: CalendarModel = .init()
    @State var currentDate = Date()
    var body: some View {
        GeometryReader{ geometry in
            VStack(spacing: 0){
                CalendarView(currentDate: currentDate, model: $calendarModel).background(in: RoundedRectangle(cornerRadius: 10)).padding(EdgeInsets(top: 1, leading: 13, bottom: 0, trailing: 13))
                ScrollViewReader { reader in
                    ScrollView {
                        VStack(alignment: .leading) {
                            Spacer().frame(height: 1).id("top")
                            HStack{
                                Text("支出：")
                                Spacer()
                                Text("2,000円")
                            }
                            Divider()
                            HStack{
                                Text("収入：")
                                Spacer()
                                Text("2,000円")
                            }
                            Divider()
                            HStack{
                                Text("差引額：")
                                Spacer()
                                Text("0円")
                            }
                            Divider()
                            Spacer()
                        }.frame(height: geometry.size.height - 340).padding().font(.title3)
                    }.disabled(calendarModel.calendarArr.count <= 35).onChange(of: calendarModel.calendarArr.count) { oldValue, newValue in
                        reader.scrollTo("top", anchor: UnitPoint(x: 0, y: 10))
                    }
                }
            }
        }
    }
}

#Preview {
    CalendarPages()
}
