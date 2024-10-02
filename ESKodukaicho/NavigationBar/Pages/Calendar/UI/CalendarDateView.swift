//
//  CalendarDateView.swift
//  CalendarSample
//
//  Created by 広瀬友哉 on 2024/09/09.
//

import SwiftUI

/// カレンダーの日付UI
///  - 繰り返し表示でカレンダーを描写
///  - 簡易的なテキストを表示
struct CalendarDateView: View {
    
    var count: Int = 1
    let lastDate: Int = 30
    @State var dateViewWidth: CGFloat = 0
    @State var detailData = 0
    @Binding var currentDate: Date
    @Binding var calendarArr: [DateComponent]
    @Binding var isSelectedDay: DateComponent
    
    var body: some View {
        GeometryReader { geo in
            Grid(alignment: .center, horizontalSpacing: 0) {
                let rowCount = calendarArr.count / 7
                ForEach(0..<rowCount, id: \.self) { week in
                    GridRow {
                        let startIndex = week * 7
                        let endIndex = startIndex + 7
                        ForEach(startIndex..<endIndex, id: \.self) { date in
                            if date < calendarArr.count {
                                DateView(width: dateViewWidth, currentDate: $currentDate, date: $calendarArr[date], isSelectedDay: $isSelectedDay)
                            }
                        }
                    }
                    if rowCount != (week + 1) {
                        Divider()
                    }
                }
            }.onAppear(){
                dateViewWidth = geo.size.width / 7
            }
        }
    }
}

struct DateView: View {
    
    let width: CGFloat
    @State var current: Bool = false
    @State var isOpenSheet: Bool = false
    @Binding var currentDate: Date
    @Binding var date: DateComponent
    @State var wage: Int = 0
    @Binding var isSelectedDay: DateComponent
    @State var isSelected: Bool = false
    
    var body: some View {
        
        VStack{
            ZStack {
                if current || (current && isSelected) {
                    Circle().foregroundStyle(.pink).frame(width: 40)
                }
                if isSelected && !current {
                    Circle().foregroundStyle(.white).frame(width: 40)
                }
                if date.month == DateTranslate(date: currentDate).getDateComponents().month?.description ?? "0" && !isSelected {
                    Text(date.day).frame(width: width).foregroundStyle(current ? .white : Color(.white)).bold(current).frame(height: 40)
                } else if isSelected {
                    Text(date.day).frame(width: width).foregroundStyle(current ? .white : Color(.black)).bold(isSelected).frame(height: 40)
                } else {
                    Text(date.day).frame(width: width).foregroundStyle(.gray).frame(height: 40)
                }
            }
            // 簡易的に書き込めるスペース
            if wage > 0 {
                Text("¥\(String(wage))").font(.caption)
            }
        }.onAppear(){
            checkCurrentDate()
        }.onChange(of: currentDate) {
            checkCurrentDate()
        }.onChange(of: isSelectedDay.day, {
            
            if date.day == isSelectedDay.day && date.month == isSelectedDay.month {
                isSelected = true
            } else {
                isSelected = false
            }
            
        }).onTapGesture {
            isSelectedDay.year = date.year
            isSelectedDay.day = date.day
            isSelectedDay.month = date.month
            
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.prepare()
            generator.impactOccurred()
            
            print(isSelectedDay.year, isSelectedDay.month, isSelectedDay.day)
        }
    }
    
    /// カレンダーの中に今日の日付があるか確認
    func checkCurrentDate(){
        let comp = DateTranslate(date: Date()).getDateComponents()
        
        // 個別にフラグを判定
        let isSameYear = comp.year == Int(date.year)
        let isSameMonth = comp.month == Int(date.month)
        let isSameDay = comp.day == Int(date.day)
        // すべての条件が満たされているか確認
        self.current = isSameYear && isSameMonth && isSameDay
    }
    
}

#Preview(body: {
    CalendarPages()
})
