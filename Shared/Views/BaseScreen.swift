//
//  BaseView.swift
//  mage-ios
//
//  Created by Kushkumar Katira on 12/10/23.
//

import SwiftUI

struct BaseScreen <Content: View> : View {
    
    private let backgroundColor: Color
    private let sideOffset: CGFloat
    private let content: Content
    
    init(backgroundColor: Color = .background,
         sideOffset: CGFloat = AppConfig.defaultSpacing,
         @ViewBuilder content: () -> Content) {
        self.backgroundColor = backgroundColor
        self.sideOffset = sideOffset
        self.content = content()
    }
    
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                content
                    .padding(.horizontal, sideOffset)
//                    .navigationTitle("")
//                    .navigationBarHidden(true)
//                    .navigationBarBackButtonHidden(true)
            }
            .background(backgroundColor)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}
