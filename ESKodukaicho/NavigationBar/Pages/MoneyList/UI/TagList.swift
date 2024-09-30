//
//  TagList.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/01.
//

import SwiftUI

struct TagList: View {
    
    let items = [
        ListTag(tagName: "交通費", tagColor: .purple),
        ListTag(tagName: "昼食", tagColor: .purple),
        ListTag(tagName: "ジュース", tagColor: .orange),
        ListTag(tagName: "推し活", tagColor: .green),
        ListTag(tagName: "開発費", tagColor: .black),
        ListTag(tagName: "雑費", tagColor: .green),
        ListTag(tagName: "交際費", tagColor: .pink),
        ListTag(tagName: "無駄遣い", tagColor: .green),
        ListTag(tagName: "生活費", tagColor: .red)
    ]
    
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        FlowLayout(alignment: .leading, spacing: 5) {
            ForEach(items.indices, id: \.self) { index in
                items[index]
            }
        }
    }
}
