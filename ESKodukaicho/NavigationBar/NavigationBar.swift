//
//  NavigationBar.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/09/29.
//

import SwiftUI

struct NavigationBar: View {
    
    @Binding var isCurrent: Int
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0){
                Spacer()
                FloatingNavigation().clipped().shadow(radius: 5)
                HStack{
                    Spacer()
                    Rectangle().fill(Color.main).frame(width: geometry.size.width * 0.7, height: 60).clipShape(RoundedRectangle(cornerRadius: 10))
                        .background(Color.clear,
                           in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                        ).padding(20).overlay {
                            HStack {
                                Spacer()
                                NavigationBarButton(isCurrent: $isCurrent, id: 0, iconName: "calendar", caption: "Calendar")
                                Spacer()
                                NavigationBarButton(isCurrent: $isCurrent, id: 1, iconName: "list.bullet", caption: "Cash book")
                                Spacer()
                            }
                        }
                    Spacer()
                }.clipped().shadow(radius: 10)
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    @Previewable @State var isCurrent: Int = 0
    NavigationBar(isCurrent: $isCurrent)
}

struct NavigationBarButton: View {
    
    @Binding var isCurrent: Int
    @State var id: Int
    @State var iconName: String
    @State var caption: String
    
    var body: some View {
        VStack{
            Image(systemName: iconName).font(.largeTitle).onTapGesture {
                isCurrent = id
                let generator = UIImpactFeedbackGenerator(style: .rigid)
                generator.prepare()
                generator.impactOccurred()
            }
            Text(caption).font(.caption)
        }.foregroundStyle(isCurrent == id ? .white : .gray)
        
    }
}
