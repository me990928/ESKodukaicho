//
//  InputView.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/02.
//

import SwiftUI

struct InputView: View {
    @State var registDate: Date = .init()
    @State var title: String = ""
    @State var genre: String = "支出"
    @State var tag: String = ""
    @State var memo: String?
    
    @FocusState var textField: Bool
    
    var body: some View {
        let placeholder = "タップしてメモを入力してください"
        ScrollView {
            VStack(){
                HStack{
                    Text("タイトル").font(.headline)
                    TextField("タイトル", text: $title).multilineTextAlignment(.trailing)
                }
                DatePicker("登録日時", selection: $registDate).font(.headline)
                HStack{
                    Text("種類").font(.headline)
                    Spacer()
                    Picker("タグ", selection: $genre) {
                        Text("支出").tag("支出")
                        Text("収入").tag("収入")
                        Text("貯金").tag("貯金")
                    }
                }
                HStack{
                    Text("タグ").font(.headline)
                    Spacer()
                    Picker("タグ", selection: $tag) {
                        Text("未分類").tag("")
                        Text("UFJ").tag("UFJ")
                        Text("財布").tag("財布")
                        Text("推し活").tag("推し活")
                    }
                }
                HStack{
                    Text("メモ").font(.headline)
                    Spacer()
                }
                VStack{
                    ZStack {
                        TextEditor(text: Binding($memo, replacingNilWith: "")).scrollContentBackground(.hidden).focused($textField)
                        Text(memo ?? placeholder).opacity(textField || ((memo?.isEmpty) != nil) ? 0 : 1).onTapGesture {
                            textField.toggle()
                        }
                    }
                }.padding().background(Color.main, in: RoundedRectangle(cornerRadius: 10)).foregroundStyle(.white)
                Button("登録") {
                    
                }.padding(.vertical).buttonStyle(.borderedProminent)
            }.padding()
        }.background(.base)
            .onTapGesture {
                if self.textField {
                    textField = false
                }
            }
    }
}

#Preview {
    InputView()
}

public extension Binding where Value: Equatable {
    init(_ source: Binding<Value?>, replacingNilWith nilProxy: Value) {
        self.init(
            get: { source.wrappedValue ?? nilProxy },
            set: { newValue in
                if newValue == nilProxy {
                    source.wrappedValue = nil
                }
                else {
                    source.wrappedValue = newValue
                }
        })
    }
}
