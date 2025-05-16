//
//  BaseView.swift
//  TappxSwiftUIExample
//
//  Created by Antonio Lai on 15/05/25.
//

import SwiftUI

struct BaseView<Content: View>: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ViewBuilder
    var content: () -> Content
    var backButtonEnabled: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            ColorTheme.secondary.edgesIgnoringSafeArea(.all)
            
            ColorTheme.primary
                .edgesIgnoringSafeArea(.top)
                .frame(height: 10, alignment: .top)
            
            content()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Image("logo tappx")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    
                    Text("app.name".localized)
                        .foregroundColor(ColorTheme.secondaryVariant)
                        .font(.headerFont())
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                if(backButtonEnabled) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    }
                } else {
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    BaseView {
        
    }
}
