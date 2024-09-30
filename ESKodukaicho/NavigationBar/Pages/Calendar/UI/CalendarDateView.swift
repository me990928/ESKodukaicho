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
    
    @Binding var calendarDetailData: [People]
    
    var body: some View {
        GeometryReader { geo in
            Grid(horizontalSpacing: 0) {
                let rowCount = calendarArr.count / 7
                ForEach(0..<rowCount, id: \.self) { week in
                    GridRow {
                        let startIndex = week * 7
                        let endIndex = startIndex + 7
                        ForEach(startIndex..<endIndex, id: \.self) { date in
                            if date < calendarArr.count {
                                DateView(width: dateViewWidth, currentDate: $currentDate, date: $calendarArr[date], calendarDetailData: $calendarDetailData)
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
    @Binding var calendarDetailData: [People]
    @State var filterdDatail: [People] = []
    @State var wage: Int = 0
    
    var body: some View {
        
        VStack{
            ZStack {
                if current {
                    Circle().foregroundStyle(.pink).frame(width: 40)
                }
                if date.month == DateTranslate(date: currentDate).getDateComponents().month?.description ?? "0" {
                    Text(date.day).frame(width: width).foregroundStyle(current ? .white : Color(.label)).bold(current)
                } else {
                    Text(date.day).frame(width: width).foregroundStyle(.gray)
                }
            }
            // 簡易的に書き込めるスペース
            if wage > 0 {
                Text("¥\(String(wage))").font(.caption)
            }
        }.onAppear(){
            checkCurrentDate()
            wage = filterPeopleWage(byYear: Int(date.year) ?? 0, month: Int(date.month) ?? 0, day: Int(date.day) ?? 0, peoples: calendarDetailData)
            filterdDatail = filterPeoples(byYear: Int(date.year) ?? 0, month: Int(date.month) ?? 0, day: Int(date.day) ?? 0, peoples: calendarDetailData)
            
        }.onChange(of: currentDate) {
            checkCurrentDate()
            wage = filterPeopleWage(byYear: Int(date.year) ?? 0, month: Int(date.month) ?? 0, day: Int(date.day) ?? 0, peoples: calendarDetailData)
            filterdDatail = filterPeoples(byYear: Int(date.year) ?? 0, month: Int(date.month) ?? 0, day: Int(date.day) ?? 0, peoples: calendarDetailData)
        }.onTapGesture {
            if wage > 0 {
                isOpenSheet.toggle()
            }
        }.sheet(isPresented: $isOpenSheet, content: {
            CalendarDetailView(calendarDatail: $filterdDatail)
        })
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
    
    func filterPeopleWage(byYear year: Int, month: Int, day: Int, peoples: [People]) -> Int {
        let filtered = filterPeoples(byYear: year, month: month, day: day, peoples: peoples)
        var wage = 0
        for filter in filtered {
            wage += filter.wage
        }
        return wage
    }
    
    func filterPeoples(byYear year: Int, month: Int, day: Int, peoples: [People]) -> [People] {
        let calendar = Calendar.current
        return peoples.filter { people in
            let components = calendar.dateComponents([.year, .month, .day], from: people.date)
            return components.year == year && components.month == month && components.day == day
        }
    }
}
