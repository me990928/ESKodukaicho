//
//  Datetranslate.swift
//  CalendarSample
//
//  Created by 広瀬友哉 on 2024/09/10.
//

import Foundation

class DateTranslate {
    
    let date: Date
    
    init(date: Date) {
        self.date = date
    }
    
    /// DateComponentsを返す
    /// - Returns: DateComponents
    func getDateComponents() -> DateComponents {
        let calender = Calendar.current
        let component = calender.dateComponents([.year, .month, .day, .weekday], from: date)
        
        return component
    }
    
    /// 曜日の文字列を返す
    /// - Returns: 曜日文字列
    func getWeekdaySymbol() -> String {
        
        let comp = getDateComponents()
        
        guard let weekday = comp.weekday else {
            return ""
        }
        
        let symbol = Calendar.current.weekdaySymbols[weekday - 1]
        
        return symbol
        
    }
    
    /// DateComponent構造体を取得
    /// - Returns: DateComponent構造体
    func getStructDateComponent() -> DateComponent {
        
        let comp = getDateComponents()
        
        guard let year = comp.year?.description else {
            fatalError("西暦の取得に失敗")
        }
        guard let month = comp.month?.description else {
            fatalError("月の取得に失敗")
        }
        guard let day = comp.day?.description else {
            fatalError("日にちの取得に失敗")
        }
        guard let weekdayString = comp.weekday?.description else {
            fatalError("曜日の取得に失敗")
        }
        guard let weekdayInt = comp.weekday else {
            fatalError("曜日の取得に失敗")
        }
        
        return DateComponent(year: year, month: month, day: day, weekday: (weekdayString, weekdayInt))
        
    }
    
    
}

/// DateComponent構造体
struct DateComponent {
    var year: String
    var month: String
    var day: String
    var weekday: (String , Int)?
}
