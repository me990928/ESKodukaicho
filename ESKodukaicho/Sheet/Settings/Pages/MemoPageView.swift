//
//  MemoPageView.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/11.
//

import SwiftUI

struct MemoPageView: View {
    var body: some View {
        ScrollView {
            VStack{
                MemoBlock()
                MemoBlock()
                MemoBlock()
                MemoBlock()
                MemoBlock()
                MemoBlock()
            }
        }.padding().background(Color.base)
    }
}

#Preview {
    MemoPageView()
}

struct MemoBlock: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("2024/10/11")
                Text("消費タイトル")
                Text("-1000円")
            }.font(.headline)
            Divider().background(Color.white)
            Text("これが私の消費した内容です。")
        }.padding().background(Color.main, in: RoundedRectangle(cornerRadius: 10)).foregroundStyle(.white)
    }
}
