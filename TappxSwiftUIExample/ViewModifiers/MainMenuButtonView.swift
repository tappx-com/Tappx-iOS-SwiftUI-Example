//
//  MainMenuButtonView.swift
//  TappxSwiftUIExample
//
//  Created by Sara on 13/5/25.
//

import SwiftUI

struct MainMenuButtonView: View {
    let imageName: String
    let title: String
    let iconColor: Color
    
    var body: some View {
        ZStack {
            Color.clear
                .background(ColorTheme.secondaryVariant)
                .shadow(color: Color.gray.opacity(0.4), radius: 2, x: 0, y: 2)
            
            HStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .shadow(color: Color.gray.opacity(0.3), radius: 2, x: 1, y: 1)
                Spacer()
                Text(title)
                    .font(.bodyFont())
                    .foregroundColor(ColorTheme.primaryVariant)
                
                Spacer()
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 20)
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

