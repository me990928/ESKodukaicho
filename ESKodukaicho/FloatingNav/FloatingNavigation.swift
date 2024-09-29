//
//  FloatingNavigationButton.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/09/29.
//

import SwiftUI

struct FloatingNavigation: View {
    
    @State var width: CGFloat = 60
    @State var isToggle: Bool = false
    
    @State var x1Offset: CGFloat = 0
    @State var x2Offset: CGFloat = 0
    @State var x3Offset: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometryReader in
            VStack{
                Spacer()
                HStack{
                    Rectangle().fill(.clear).frame(width: geometryReader.size.width, height: 60).overlay {
                        HStack {
                            Rectangle().frame(width: width, height: 60).foregroundColor(Color("FTB_BK")).clipShape(RoundedRectangle(cornerRadius: 90))
                            Spacer()
                        }
                    }.overlay {
                        HStack(){
                            ZStack {
                                Button {
                                    print("black")
                                } label: {
                                    Circle().fill(Color("FTB_N")).overlay(content: {
                                        Image(systemName: "square.and.pencil").font(.title).foregroundStyle(Color("FTB_B"))
                                    }).padding(5)
                                }.offset(x: x1Offset)
                                Button {
                                    print("yellow")
                                } label: {
                                    Circle().fill(Color("FTB_N")).overlay(content: {
                                        Image(systemName: "tag").font(.title).foregroundStyle(Color("FTB_B"))
                                    }).padding(5)
                                }.offset(x: x2Offset)
                                Button {
                                    print("black")
                                } label: {
                                    Circle().fill(Color("FTB_N")).overlay(content: {
                                        Image(systemName: "gearshape").font(.title).foregroundStyle(Color("FTB_B"))
                                    }).padding(5)
                                }.offset(x: x3Offset)
                                Circle().fill(Color("FTB_B")).overlay(content: {
                                    Image(systemName: "plus").font(.title).foregroundStyle(Color("FTB_N")).rotationEffect(isToggle ? .degrees(45) : .degrees(0))
                                })
                                    .onTapGesture {
                                        
                                        withAnimation{
                                            isToggle.toggle()
                                        }
                                        withAnimation {
                                            if isToggle {
                                                width = 60 * 3 + 60 + 31
                                                x1Offset = 60 * 3 + 30
                                                x2Offset = 60 * 2 + 20
                                                x3Offset = 60 + 10
                                            } else {
                                                width = 60
                                                x1Offset = 0
                                                x2Offset = 0
                                                x3Offset = 0
                                            }
                                        }
                                    }
                            }
                            Spacer()
                        }
                    }
                }
            }.padding(.leading)
        }
    }
}

#Preview {
    FloatingNavigation()
}

struct FloatingNavigationButton {
    
}
