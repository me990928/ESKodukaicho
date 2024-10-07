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
                            Rectangle().frame(width: width, height: 50).foregroundColor(.mainColor2).clipShape(RoundedRectangle(cornerRadius: 90))
                            Spacer()
                        }
                    }.overlay {
                        HStack(){
                            ZStack {
                                
                                FloatingNavigationButton(isOpen: $isInputOpen, xOffset: $x1Offset, iconName: "square.and.pencil")
                                
                                FloatingNavigationButton(isOpen: $isTagsOpen, xOffset: $x2Offset, iconName: "tag")
                                
                                FloatingNavigationButton(isOpen: $isGraphOpen, xOffset: $x3Offset, iconName: "chart.bar.xaxis")
                                
                                FloatingNavigationButton(isOpen: $isSettingsOpen, xOffset: $x4Offset, iconName: "gearshape")
                                
                                
                                Circle().fill(Color(.accent)).overlay(content: {
                                    Image(systemName: "plus").font(.headline).foregroundStyle(Color(.black)).rotationEffect(isToggle ? .degrees(45) : .degrees(0))
                                })
                                .onTapGesture {
                                    
                                    let generator = UIImpactFeedbackGenerator(style: .light)
                                    generator.prepare()
                                    generator.impactOccurred()
                                    
                                    withAnimation(.bouncy(duration: 0.2)){
                                        isToggle.toggle()
                                    }
                                    withAnimation(.easeIn(duration: 0.2)) {
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
                    InputView()
                }
                .sheet(isPresented: $isTagsOpen) {
                    TagSheet()
                }
                .sheet(isPresented: $isSettingsOpen) {
                    Text("Setting")
                }.sheet(isPresented: $isGraphOpen) {
                    GraphView()
                }
        }
    }
}

#Preview {
    VStack{
        FloatingNavigation()
    }.background(Color.base)
}

struct FloatingNavigationButton: View {
    
    @Binding var isOpen: Bool
    @Binding var xOffset: CGFloat
    let iconName: String
    
    var body: some View {
        Button {
            isOpen.toggle()
        } label: {
            Circle().fill(Color(.main)).overlay(content: {
                Image(systemName: iconName).font(.body).foregroundStyle(Color(.white))
            }).padding(5)
        }.offset(x: xOffset)
    }
}
