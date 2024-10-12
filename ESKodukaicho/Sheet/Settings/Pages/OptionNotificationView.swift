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
    let notificationId: String = "dailyNotification"
    var body: some View {
        VStack{
            List{
                Toggle("通知する", isOn: $isNotificationStorage)
                DatePicker("通知したい時間", selection: $notificationTime, displayedComponents: .hourAndMinute).disabled(!isNotificationStorage)
            }
        }.onAppear(){
            requestNotificationPermission()
//            checkPendingNotifications()
        }.onChange(of: notificationTime) { oldValue, newValue in
            if isNotificationStorage, !oldValue.description.isEqual(newValue.description){
                scheduleNotification(at: newValue)
            }
        }.onChange(of: isNotificationStorage) { oldValue, newValue in
            if !oldValue, newValue {
                scheduleNotification(at: notificationTime)
            }
            if !isNotificationStorage {
                scheduleDeleteNotification()
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
    
    func scheduleDeleteNotification(){
        let lcNotificationCenter = UNUserNotificationCenter.current()
        lcNotificationCenter.removePendingNotificationRequests(withIdentifiers: [notificationId, "059872E8-36E8-4D93-AA01-78F367AF831D", "70A806E3-0450-4B8C-AC72-6010C1C4577B", "7B9615F8-41D2-461A-A245-6361B9488C26"])
    }
    
    // debug用
//    func checkPendingNotifications() {
//        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
//            for request in requests {
//                print("通知ID: \(request.identifier), タイトル: \(request.content.title), 本文: \(request.content.body)")
//            }
//        }
//    }
}

#Preview {
    OptionNotificationView()
}
