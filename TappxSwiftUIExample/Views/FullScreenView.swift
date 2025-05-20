//
//  FullScreenView.swift
//  TappxSwiftUIExample
//
//  Created by Sara on 12/5/25.
//

import SwiftUI
import TappxFramework

struct FullScreenView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var interstitialAd = InterstitialAd()
    @ObservedObject private var rewardedAd = RewardedAd()
    
    @State private var autoShowEnabled = false
    
    var adType: AdType = .interstitial
    
    var body: some View {
        BaseView(content:  {
            VStack(spacing: 0) {
                Text(adType == .interstitial ? "interstitial".localized : "rewarded".localized)
                    .font(.titleFont())
                    .foregroundColor(ColorTheme.primary)
                    .padding(.top, 30)
                
                if adType == .interstitial {
                    HStack {
                        Text("text.autoShow".localized)
                            .font(.secondFont())
                            .padding(.leading, 8)
                            .frame(width: 100, alignment: .leading)
                        
                        Toggle("", isOn: $autoShowEnabled)
                            .toggleStyle(SwitchToggleStyle(tint: ColorTheme.switchOn))
                            .onChange(of: autoShowEnabled) { newValue in
                                autoShowAction()
                            }
                            .padding(.trailing, 8)
                    }
                    .frame(width: 175, height: 50)
                    .padding(.top, 16)
                }
                
                VStack(spacing: 20) {
                    Button(action: loadAction) {
                        HStack {
                            Spacer()
                            Text("button.load".localized)
                                .font(.bodyFont())
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .frame(height: 55)
                        .background(Color.white)
                    }
                    .cornerRadius(4)
                    .padding(.horizontal, 40)
                    
                    if !(adType == .interstitial && autoShowEnabled) {
                        Button(action: readyAction) {
                            HStack {
                                Spacer()
                                Text("button.ready".localized)
                                    .font(.bodyFont())
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .frame(height: 55)
                            .background(Color.white)
                        }
                        .cornerRadius(4)
                        .padding(.horizontal, 40)
                        
                        Button(action: showAction) {
                            HStack {
                                Spacer()
                                Text("button.show".localized)
                                    .font(.bodyFont())
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .frame(height: 55)
                            .background(Color.white)
                        }
                        .cornerRadius(4)
                        .padding(.horizontal, 40)
                    }
                }
                .padding(.top, 15)
                Spacer(minLength: 30)
                
                VStack(spacing: 15) {
                    Text("text.status".localized)
                        .font(.titleFont())
                        .foregroundColor(.primary)
                        .padding(.top, 12)
                    
                    ScrollView {
                        if (adType == .interstitial) {
                            Text(interstitialAd.textState)
                                .font(.secondFont())
                                .foregroundColor(ColorTheme.secondaryVariant)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(8)
                        } else {
                            Text(rewardedAd.textState)
                                .font(.secondFont())
                                .foregroundColor(ColorTheme.secondaryVariant)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(8)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(ColorTheme.scrollBackground)
                    .cornerRadius(8)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 40)
                }
                .frame(maxWidth: .infinity)
                .background(ColorTheme.darkGray)
            }
        }, backButtonEnabled: true)
    }
    
    // MARK: - Actions
    
    private func autoShowAction() {
        if adType == .interstitial {
            interstitialAd.autoShow(enable: autoShowEnabled)
        }
    }
    
    private func loadAction() {
        if adType == .interstitial {
            interstitialAd.load()
        } else {
            rewardedAd.load()
        }
    }
    
    private func readyAction() {
        if adType == .interstitial {
            interstitialAd.isReady()
        } else {
            rewardedAd.isReady()
        }
    }
    
    private func showAction() {
        if adType == .interstitial {
            interstitialAd.show()
        } else {
            rewardedAd.show()
        }
    }
    
}


#Preview {
    FullScreenView()
}
