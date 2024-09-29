//
//  ContentView.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/09/29.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    @State var isCurrent: Int = 0
    @State var xOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                HStack(spacing: 0){
                    CalendarView().frame(width: geometry.size.width)
                    MoneyList().frame(width: geometry.size.width)
                }.offset(x: xOffset).onChange(of: isCurrent) {
                    withAnimation {
                        if isCurrent == 0 {
                            xOffset = 0
                        } else if isCurrent == 1 {
                            xOffset = 0 - geometry.size.width
                        }
                    }
                }
            }
            VStack{
                Spacer()
                NavigationBar(isCurrent: $isCurrent)
            }
        }
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
