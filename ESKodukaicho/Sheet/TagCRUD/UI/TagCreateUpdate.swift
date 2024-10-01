//
//  TagCreateUpdate.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/01.
//

import SwiftUI

struct TagCreateUpdate: View {
    @State var buttonText: String = "登録"
    @State var tagName: String = ""
    @State var tagColor: Color = .red
    @State var selectedGenre: String = "支出"
    var body: some View {
        VStack{
            HStack{
                Text("プレビュー").font(.headline)
                Spacer()
            }
            ListTag(tagName: tagName, tagColor: tagColor, isActive: true).disabled(true)
            
            HStack{
                Text("タグ名").font(.headline)
                Spacer()
                TextField("タグ名", text: $tagName).multilineTextAlignment(.trailing)
            }
            ColorPicker("色", selection: $tagColor).font(.headline)
            
            HStack{
                Text("ジャンル").font(.headline)
                Spacer()
                Picker("ジャンル", selection: $selectedGenre) {
                    Text("支出").tag("支出")
                    Text("収入").tag("収入")
                    Text("貯金").tag("貯金")
                }
            }
            
            Button {
                
            } label: {
                Text(buttonText)
            }.buttonStyle(.borderedProminent)
            
            
            
            
            Spacer()
        }.padding()
    }
}

#Preview {
    TagCreateUpdate()
}
