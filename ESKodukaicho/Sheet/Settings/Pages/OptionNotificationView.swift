//
//  OptionNotificationView.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/09.
//

import SwiftUI

struct OptionNotificationView: View {
    
    @AppStorage("isNotification") var isNotificationStorage: Bool = false
    @AppStorage("isNotificationDate") var notificationTime: Date = .init()
    @AppStorage("isNotificationId") var notificationId: String = UUID().uuidString
    var body: some View {
        VStack{
            List{
                Toggle("通知する", isOn: $isNotificationStorage)
                DatePicker("通知したい時間", selection: $notificationTime, displayedComponents: .hourAndMinute).disabled(!isNotificationStorage)
            }
        }.onAppear(){
            requestNotificationPermission()
        }.onChange(of: notificationTime) { oldValue, newValue in
            if isNotificationStorage, !oldValue.description.isEqual(newValue.description){
                scheduleNotification(at: newValue)
            }
        }.onChange(of: isNotificationStorage) { oldValue, newValue in
            if !oldValue, newValue {
                scheduleNotification(at: notificationTime)
            }
        }
    }
    
    func requestNotificationPermission(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Notification permission granted")
            } else if let error {
                print("Error requesting notification permission: \(error.localizedDescription)")
            }
        }
    }
    
    func scheduleNotification(at date: Date){
        let content = UNMutableNotificationContent()
        content.title = "今日の収支を振り返ってみましょう"
        content.body = "今日の収支はどうですか？アプリに記入してみましょう。"
        content.sound = .default
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: notificationId, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
        
        
    }
}

#Preview {
    OptionNotificationView()
}
