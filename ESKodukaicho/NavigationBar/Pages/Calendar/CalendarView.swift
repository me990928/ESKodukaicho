//
//  CalendarView.swift
//  CalendarSample
//
//  Created by 広瀬友哉 on 2024/09/09.
//

import SwiftUI

/// カレンダーのメイン
struct CalendarView: View {
    
    @Binding var calendarModel: CalendarModel
    
    @State var currentDate: Date
    @State var year: String = ""
    @State var month: String = ""
    
    @State var screenWidth: CGFloat = 0
    
    
    let columns = [
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity))
    ]
    
    let dateFormatter = DateFormatter()
    
    init(currentDate: Date, model: Binding<CalendarModel>){
        
        self.currentDate = currentDate
        
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        self._calendarModel = model
        
    }
    
    var body: some View {
        VStack{
            
            ZStack {
                HStack(spacing: 0){
                    
                    Group{
                        // 先月、来月の選択
                        
                        
                    }.foregroundStyle(.white)
                    
                    Spacer()
                    
                }.padding(.horizontal).padding(.top)
                
                
                HStack {
                    
                    Button(action: {
                        backPageCalendar()
                    }, label: {
                        Image(systemName: "chevron.backward")
                    }).padding(.leading)
                    
                    Spacer()
                    
                    Text("\(year)年 ").bold()
                    Text("\(month)月").bold()
                    
                    Spacer()
                    
                    Button(action: {
                        nextPageCalendar()
                    }, label: {
                        Image(systemName: "chevron.forward")
                    }).padding(.trailing)
                    
                }.foregroundStyle(.white).onAppear(){
                    updateCurrentDate()
                }.onChange(of: currentDate) {
                    updateCurrentDate()
                }.padding(.top)
            }
            
            LazyVGrid(columns: columns, alignment: .center, spacing: 0, content: {
                Text("日")
                Text("月")
                Text("火")
                Text("水")
                Text("木")
                Text("金")
                Text("土")
            }).frame(maxWidth: .infinity).foregroundStyle(.white)
            
            CalendarDateView(currentDate: $currentDate, calendarArr: $calendarModel.calendarArr, isSelectedDay: $calendarModel.selectedDate)
            
        }.onAppear(){
            calendarModel.createCalendar(current: currentDate)
            print(calendarModel.selectedDate)
        }.background(Color(.main)).frame(height: calendarModel.calendarArr.count > 35 ? 405 : 350)
        .gesture(
            DragGesture()
                .onEnded { value in
                        
                    let generator = UIImpactFeedbackGenerator(style: .light)
                    generator.prepare()
                    
                    if value.translation.height < -50 {
                        // 上スワイプ
                        print("上")
                        nextPageCalendar()
                        generator.impactOccurred()
                    } else if value.translation.height > 30 {
                        // 下スワイプ
                        print("下")
                        backPageCalendar()
                        generator.impactOccurred()
                    } else if value.translation.width > 30 {
                        print("右")
                        backPageCalendar()
                        generator.impactOccurred()
                    } else if value.translation.width < -30 {
                        print("左")
                        nextPageCalendar()
                        generator.impactOccurred()
                    }
                }
        )
    }
    
    /// 年月のテキストを変更
    func updateCurrentDate(){
        year = DateTranslate(date: currentDate).getStructDateComponent().year
        month = DateTranslate(date: currentDate).getStructDateComponent().month
    }
    
    func nextPageCalendar(){
        currentDate = calendarModel.upCalendarMonth(current: currentDate)
        calendarModel.calendarArr = []
        calendarModel.createCalendar(current: currentDate)
        calendarModel.selectedDate.month = String((Int(self.month) ?? 0) + 1)
        if calendarModel.selectedDate.month == "13" {
            calendarModel.selectedDate.month = "1"
            calendarModel.selectedDate.year = String((Int(self.year) ?? 0) + 1)
        }
        print(calendarModel.selectedDate)
    }
    
    func backPageCalendar(){
        currentDate = calendarModel.downCalendarMonth(current: currentDate)
        calendarModel.calendarArr = []
        calendarModel.createCalendar(current: currentDate)
        calendarModel.selectedDate.month = String((Int(self.month) ?? 0) - 1)
        if calendarModel.selectedDate.month == "0" {
            calendarModel.selectedDate.month = "12"
            calendarModel.selectedDate.year = String((Int(self.year) ?? 0) - 1)
        }
        print(calendarModel.selectedDate)
    }
    
}

#Preview {
    @Previewable @State var model = CalendarModel()
    CalendarView(currentDate: Date(), model: .init(projectedValue: $model))
}

extension String {
    func toInt() -> Int? {
        Int(self)
    }
}
