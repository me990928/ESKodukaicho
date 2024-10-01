//
//  TagSheet.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/01.
//

import SwiftUI

struct TagModel {
    var tagName: String
    var tagColor: Color
    var genre: String
}

struct TagSheet: View {
    
    @State var isAddItem: Bool = false
    @State var tags: [TagModel] = [
        TagModel(tagName: "UFJ", tagColor: .red, genre: "貯金"),
        TagModel(tagName: "推し活", tagColor: .green, genre: "支出"),
        
    ]
    
    
    var body: some View {
        NavigationSplitView {
            List {
                Section(header: Text("タグ一覧")){
                    ForEach(tags, id: \.self.tagName) { item in
                        NavigationLink(item.tagName) {
                            TagCreateUpdate(buttonText: "更新", tagName: item.tagName, tagColor: item.tagColor, selectedGenre: item.genre)
                        }
                    }.onDelete { IndexSet in
                        deleteItem(at: IndexSet)
                    }
                }
                
            }.navigationDestination(isPresented: $isAddItem, destination: {
                TagCreateUpdate()
            }).toolbar {
                ToolbarItem {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("No selection")
        }
    }
    
    func addItem() {
        isAddItem.toggle()
    }
    
    func deleteItem(at offsets: IndexSet) {
        self.tags.remove(atOffsets: offsets)
    }
    
}


#Preview {
    TagSheet()
}
