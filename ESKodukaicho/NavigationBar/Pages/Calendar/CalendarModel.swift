//
//  CalendarModel.swift
//  CalendarSample
//
//  Created by 広瀬友哉 on 2024/09/09.
//

import Foundation

@Observable
class CalendarModel {
    
    var calendarArr: [DateComponent] = []
    var selectedDate: DateComponent = .init(year: DateTranslate(date: Date()).getDateComponents().year?.description ?? "-1", month: DateTranslate(date: Date()).getDateComponents().month?.description ?? "-1", day: DateTranslate(date: Date()).getDateComponents().day?.description ?? "-1")
    
    // 先月の最初最後, 初日から末日, 来月の最初最後
    // １０月の例
    // [(29,30), (1,31), (1,2)]
    private var dateArr: [(Int, Int)] = [(0,0), (0,0), (0,0)]
    
    // 初日から月末日の1~31の数字の配列 - A
    // 初日から日曜までの先月の日数を追加 - B
    // 末日から土曜までの来月の日数を追加 - C
    // 一週間区切りで-1を追加 - D
    
    /// 対象月のカレンダーを作成
    /// - Parameter current: 対象月
    func createCalendar(current: Date){
        // let current = createDate()
        getDateFirstToLast(current: current)
        getDateLastMonth(current: current)
        getDateNextMonth(current: current)
        
        let comp = DateTranslate(date: current).getDateComponents()
        
        if dateArr[0].1 != 0 {
            for day in dateArr[0].0...dateArr[0].1 {
                calendarArr.append(DateComponent(year: String(comp.year ?? 0), month: String((comp.month ?? 0) - 1), day: String(day)))
            }
        }
        for day in dateArr[1].0...dateArr[1].1 {
            calendarArr.append(DateComponent(year: String(comp.year ?? 0), month: String(comp.month ?? 0), day: String(day)))
        }
        if dateArr[2].0 != 0 {
            for day in dateArr[2].0...dateArr[2].1 {
                calendarArr.append(DateComponent(year: String(comp.year ?? 0), month: String((comp.month ?? 0) + 1), day: String(day)))
            }
        }
        
    }
    
    /// 初日から月末日の1~31の数字の配列
    /// - Parameter current: 対象の月内の日付
    private func getDateFirstToLast(current: Date){
        
        let calendar = Calendar.current
        
        guard let startOfMonthDate = calendar.date(from: calendar.dateComponents([.year, .month], from: current)) else {
            fatalError("初日の取得に失敗")
        }
        
        guard let endOfMonthDate = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonthDate) else {
            fatalError("末日の取得に失敗")
        }
        
        dateArr[1] = (DateTranslate(date: startOfMonthDate).getDateComponents().day ?? 0, DateTranslate(date: endOfMonthDate).getDateComponents().day ?? 0)
        
    }
    
    
    /// 初日から日曜までの先月の日数を追加
    /// - Parameter current: 対象の月内の日付
    private func getDateLastMonth(current: Date){
        let calendar = Calendar.current
        
        guard let startOfMonthDate = calendar.date(from: calendar.dateComponents([.year, .month], from: current)) else {
            fatalError("初日の取得に失敗")
        }
        
        guard let endLastMonthDays = calendar.date(byAdding: DateComponents(day: -1), to: startOfMonthDate) else {
            fatalError("先月の末日の取得に失敗")
        }
        
        guard let weekdayInt = DateTranslate(date: startOfMonthDate).getDateComponents().weekday else {
            fatalError("曜日の取得に失敗しました")
        }
        
        guard let startLastMonthDays = calendar.date(byAdding: DateComponents(day: 0 - (weekdayInt - 1)), to: startOfMonthDate) else {
            fatalError("先月表示分の初日の取得に失敗")
        }
        
        if weekdayInt == 1 {
            dateArr[0] = (0,0)
        } else {
            dateArr[0] = (DateTranslate(date: startLastMonthDays).getDateComponents().day ?? 0 , DateTranslate(date: endLastMonthDays).getDateComponents().day ?? 0)
        }
        
    }
    
    /// 末日から来月の日数を追加
    /// - Parameter current: 対象の月内の日付
    private func getDateNextMonth(current: Date){
        
        let calendar = Calendar.current
        
        guard let startOfMonthDate = calendar.date(from: calendar.dateComponents([.year, .month], from: current)) else {
            fatalError("初日の取得に失敗")
        }
        
        guard let endOfMonthDate = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonthDate) else {
            fatalError("末日の取得に失敗")
        }
        
        guard let weekdayInt = DateTranslate(date: endOfMonthDate).getDateComponents().weekday else {
            fatalError("曜日の取得に失敗しました")
        }
        
        guard let startNextMonthDate = calendar.date(byAdding: DateComponents(day: 1), to: endOfMonthDate) else {
            fatalError("来月表示分の初日の取得に失敗")
        }
        
        guard let endNextMonthDate = calendar.date(byAdding: DateComponents(day: (7 - weekdayInt)), to: endOfMonthDate) else {
            fatalError("来月表示分の末日の取得に失敗")
        }
        
        if weekdayInt == 7 {
            dateArr[2] = (0,0)
        } else {
            dateArr[2] = (DateTranslate(date: startNextMonthDate).getDateComponents().day ?? 0, DateTranslate(date: endNextMonthDate).getDateComponents().day ?? 0)
        }
    }
    
    /// 指定した月の翌月一日を取得
    /// - Parameter current: 指定した月
    /// - Returns: 翌月一日
    func upCalendarMonth(current: Date) -> Date {
        let calendar = Calendar.current
        
        guard let startOfMonthDate = calendar.date(from: calendar.dateComponents([.year, .month], from: current)) else {
            fatalError("初日の取得に失敗")
        }
        
        guard let upMonth = calendar.date(byAdding: DateComponents(month: 1), to: startOfMonthDate) else {
            fatalError("来月のDate取得に失敗")
        }
        
        return upMonth
        
    }
    
    /// 指定した月の先月一日を取得
    /// - Parameter current: 指定した月
    /// - Returns: 先月一日
    func downCalendarMonth(current: Date) -> Date {
        let calendar = Calendar.current
        
        guard let startOfMonthDate = calendar.date(from: calendar.dateComponents([.year, .month], from: current)) else {
            fatalError("初日の取得に失敗")
        }
        
        guard let downMonth = calendar.date(byAdding: DateComponents(month: -1), to: startOfMonthDate) else {
            fatalError("先月のDate取得に失敗")
        }
        
        return downMonth
    }
    
    /// 指定したDate型を作成
    /// - Returns: Date型
    func createDate()->Date{// Calendarを使用
        let calendar = Calendar.current
        
        // DateComponentsを作成（ここで好きな日時を指定）
        var dateComponents = DateComponents()
        dateComponents.year = 2015   // 年
        dateComponents.month = 2     // 月
        dateComponents.day = 1      // 日
        dateComponents.hour = 15     // 時
        dateComponents.minute = 30   // 分
        dateComponents.second = 0    // 秒
        
        // CalendarからDateを作成
        if let customDate = calendar.date(from: dateComponents) {
            return customDate
        } else {
            fatalError("無効な日時です")
        }
    }
    
}
