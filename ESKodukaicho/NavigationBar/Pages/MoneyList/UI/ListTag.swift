//
//  ListTag.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/01.
//

import SwiftUI

struct ListTag: View {
    
    @State var isActive: Bool = true
    
    let name: String
    // 最終的にカラーソースでString
    let color: Color
    
    init(tagName name: String, tagColor color: Color) {
        
        if name.isEmpty {
            self.name = "未分類"
        } else {
            self.name = name
        }
        
        self.color = color
    }
    
    var body: some View {
        Text(name).foregroundStyle(.white).padding(5).background(color ,in: RoundedRectangle(cornerRadius: 10)).onTapGesture {
            isActive.toggle()
        }.opacity(isActive ? 1 : 0.5)
    }
}

#Preview {
    ListTag(tagName: "TagA", tagColor: .red)
}
