//
//  InterstitialAd.swift
//  TappxSwiftUIExample
//
//  Created by Sara on 12/5/25.
//

import SwiftUI
import TappxFramework

class InterstitialAd: NSObject, ObservableObject {
    @Published var textState: String = ""
    
    private var interstitialAd: TappxInterstitialAd? = nil
    private var autoShow: Bool = false
    
    func load(tappxKey: String? = nil) {
        self.interstitialAd = TappxInterstitialAd(delegate: self)
        // Call setAutoShowWhenReady only for the autoShow case
        self.interstitialAd?.setAutoShowWhenReady(enable: self.autoShow)
        
        if let tappxKey = tappxKey {
            let settings = TappxSettings()
            settings.setKeywords(keywords: [tappxKey])
            self.interstitialAd?.load(settings: settings)
            return
        }
        
        self.interstitialAd?.load()
    }
    
    func isReady() {
        let readyStatus = String(self.interstitialAd?.isReady() ?? false)
        self.textState = "interstitial".localized + "status.ready".localized + readyStatus + "\n" + textState
    }
    
    func show() {
        self.interstitialAd?.show(from: nil)
    }
    
    func autoShow(enable: Bool) {
        self.autoShow = enable
    }
        
}


extension InterstitialAd: TappxInterstitialAdDelegate {
    
    func tappxInterstitialAdDidFail(interstitialAd: TappxInterstitialAd, error: TappxErrorAd) {
        self.interstitialAd = nil
        let errorMessage = TappxErrorManager.message(for: error.code)
        self.textState = "interstitial".localized + "status.failed".localized + errorMessage + "\n" + textState
    }
    
    func tappxInterstitialAdDidFinishLoad(interstitialAd: TappxInterstitialAd) {
        self.textState = "interstitial".localized + "status.loaded".localized + "\n" + textState
    }
    
    func tappxInterstitialAdDidAppear(interstitialAd: TappxInterstitialAd) {
        self.textState = "interstitial".localized + "status.appeared".localized + "\n" + textState
    }
    
    func tappxInterstitialAdDidPress(interstitialAd: TappxInterstitialAd) {
        self.textState = "interstitial".localized + "status.pressed".localized + "\n" + textState
    }
    
    func tappxInterstitialAdDidClose(interstitialAd: TappxInterstitialAd) {
        self.textState = "interstitial".localized + "status.closed".localized + "\n" + textState
    }
    
    func tappxInterstitialAdDismissed(interstitialAd: TappxInterstitialAd) {
        self.interstitialAd = nil
        self.textState = "interstitial".localized + "status.dismissed".localized + "\n" + textState
    }
    
}
