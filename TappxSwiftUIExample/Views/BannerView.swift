//
//  BannerView.swift
//  TappxSwiftUIExample
//
//  Created by Sara on 12/5/25.
//

import SwiftUI
import TappxFramework

struct BannerView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var textState: String = ""
    
    var adType: AdType = .banner
    
    var body: some View {
        BaseView(content: {
            VStack(spacing: 0) {
                VStack {
                    Text(adType == .banner ? "banner".localized : "MREC".localized)
                        .font(.titleFont())
                        .foregroundColor(ColorTheme.primary)
                        .padding(.top, 30)
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: 320)
                            .padding(.horizontal, 16)
                        
                        UITappxBannerView(size: adType == .banner ? .size320x50 : .size300x250, animation: .random) { event in
                            switch event {
                            case .didClose(_): // let bannerView
                                self.updateLogMessage(message: "status.closed".localized)
                                break
                            case .didPress(_): // let bannerView
                                self.updateLogMessage(message: "status.pressed".localized)
                                break
                            case .didFinishLoad(_): // let bannerView
                                self.updateLogMessage(message: "status.loaded".localized)
                                break
                            case .didFail(_, let error): // let bannerView
                                let errorMessage = TappxErrorManager.message(for: error.code)
                                self.updateLogMessage(message: "status.failed".localized + errorMessage)
                                break
                            }
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 15)
                }
                .frame(maxWidth: .infinity)
                
                VStack(spacing: 15) {
                    Text("text.status".localized)
                        .font(.titleFont())
                        .foregroundColor(.primary)
                        .padding(.top, 12)
                    
                    ScrollView {
                        Text(textState)
                            .font(.secondFont())
                            .foregroundColor(ColorTheme.secondaryVariant)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(8)
                    }
                    .frame(maxWidth: .infinity)
                    .background(ColorTheme.scrollBackground)
                    .cornerRadius(8)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 60)
                }
                .frame(maxWidth: .infinity)
                .background(ColorTheme.darkGray)
            }
        }, backButtonEnabled: true)
        .ignoresSafeArea(edges: .bottom)
    }
    
    private func updateLogMessage(message: String) {
        let messageStart = adType == .banner ? "banner".localized : "MREC".localized
        self.textState = "\(messageStart) \(message)\n \(textState)"
    }
}

#Preview {
    BannerView()
}
