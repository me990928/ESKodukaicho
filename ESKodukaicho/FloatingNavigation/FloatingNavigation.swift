//
//  FloatingNavigationButton.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/09/29.
//

import SwiftUI

struct FloatingNavigation: View {
    
    @State var width: CGFloat = 50
    @State var isToggle: Bool = false
    
    @State var isInputOpen: Bool = false
    @State var isSettingsOpen: Bool = false
    @State var isTagsOpen: Bool = false
    @State var isGraphOpen: Bool = false
    
    @State var x1Offset: CGFloat = 0
    @State var x2Offset: CGFloat = 0
    @State var x3Offset: CGFloat = 0
    @State var x4Offset: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometryReader in
            VStack{
                Spacer()
                HStack{
                    Rectangle().fill(.clear).frame(width: geometryReader.size.width, height: 50).overlay {
                        HStack {
                            Rectangle().frame(width: width, height: 50).foregroundColor(Color("FTB_BK")).clipShape(RoundedRectangle(cornerRadius: 90))
                            Spacer()
                        }
                    }.overlay {
                        HStack(){
                            ZStack {
                                
                                Button {
                                    isInputOpen.toggle()
                                } label: {
                                    Circle().fill(Color("FTB_N")).overlay(content: {
                                        Image(systemName: "square.and.pencil").font(.body).foregroundStyle(Color("FTB_B"))
                                    }).padding(5)
                                }.offset(x: x1Offset)
                                
                                Button {
                                    isTagsOpen.toggle()
                                } label: {
                                    Circle().fill(Color("FTB_N")).overlay(content: {
                                        Image(systemName: "tag").font(.body).foregroundStyle(Color("FTB_B"))
                                    }).padding(5)
                                }.offset(x: x2Offset)
                                
                                Button {
                                    isGraphOpen.toggle()
                                } label: {
                                    Circle().fill(Color("FTB_N")).overlay(content: {
                                        Image(systemName: "chart.bar.xaxis").font(.body).foregroundStyle(Color("FTB_B"))
                                    }).padding(5)
                                }.offset(x: x3Offset)
                                
                                Button {
                                    isSettingsOpen.toggle()
                                } label: {
                                    Circle().fill(Color("FTB_N")).overlay(content: {
                                        Image(systemName: "gearshape").font(.body).foregroundStyle(Color("FTB_B"))
                                    }).padding(5)
                                }.offset(x: x4Offset)
                                
                                Circle().fill(Color("FTB_B")).overlay(content: {
                                    Image(systemName: "plus").font(.body).foregroundStyle(Color("FTB_N")).rotationEffect(isToggle ? .degrees(45) : .degrees(0))
                                })
                                .onTapGesture {
                                    
                                    let generator = UIImpactFeedbackGenerator(style: .light)
                                    generator.prepare()
                                    generator.impactOccurred()
                                    
                                    withAnimation{
                                        isToggle.toggle()
                                    }
                                    withAnimation {
                                        if isToggle {
//                                            width = 50 * 3 + 60 + 22
                                            width = 50 * 3 + 60 + 22 + 58
                                            x1Offset = 60 * 4
                                            x2Offset = 60 * 3
                                            x3Offset = 60 * 2
                                            x4Offset = 60
                                        } else {
                                            width = 50
                                            x1Offset = 0
                                            x2Offset = 0
                                            x3Offset = 0
                                            x4Offset = 0
                                        }
                                    }
                                }
                            }
                            Spacer()
                        }
                    }
                }
            }.padding(.leading)
                .sheet(isPresented: $isInputOpen) {
                    Text("Input")
                }
                .sheet(isPresented: $isTagsOpen) {
                    TagSheet()
                }
                .sheet(isPresented: $isSettingsOpen) {
                    Text("Setting")
                }.sheet(isPresented: $isGraphOpen) {
                    Text("Graph")
                }
        }
    }
}

#Preview {
    FloatingNavigation()
}

struct FloatingNavigationButton {
    
}
