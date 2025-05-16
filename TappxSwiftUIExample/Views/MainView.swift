//
//  MainView.swift
//  TappxSwiftUIExample
//
//  Created by Sara on 12/5/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            BaseView {
                VStack {
                    VStack(spacing: 25) {
                        NavigationLink(destination: BannerView(adType: .banner)) {
                            MainMenuButtonView(imageName: "Banner", title: NSLocalizedString("button.banner", comment: ""), iconColor: ColorTheme.primary)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        
                        NavigationLink(destination: BannerView(adType: .mrec)) {
                            MainMenuButtonView(imageName: "MREC", title: NSLocalizedString("button.MREC", comment: ""), iconColor: ColorTheme.primary)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        
                        NavigationLink(destination: FullScreenView(adType: .interstitial)) {
                            MainMenuButtonView(imageName: "Interstitial", title: NSLocalizedString("button.interstitial", comment: ""), iconColor: ColorTheme.primary)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        
                        NavigationLink(destination: FullScreenView(adType: .rewarded)) {
                            MainMenuButtonView(imageName: "Rewarded", title: NSLocalizedString("button.rewarded", comment: ""), iconColor: ColorTheme.primary)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Spacer()
                        HStack {
                            Text("\("text.version".localized) \(TappxFramework.sdkVersion())")
                                .font(.secondFont())
                            Spacer()
                        }
                        .padding(.bottom, 20)
                    }
                    .padding(.top, 45)
                    .padding(.horizontal, 30)
                }
            }
            
        }
    }
}


#Preview {
    MainView()
}
