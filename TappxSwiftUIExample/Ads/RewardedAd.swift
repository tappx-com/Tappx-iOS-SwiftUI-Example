//
//  RewardedAd.swift
//  TappxSwiftUIExample
//
//  Created by Sara on 12/5/25.
//

import SwiftUI
import TappxFramework


class RewardedAd: NSObject, ObservableObject {
    @Published var textState: String = ""
    
    private var rewardedAd: TappxRewardedAd? = nil
    
    func load(tappxKey: String? = nil) {
        rewardedAd = TappxRewardedAd(delegate: self)
        self.rewardedAd?.setAutoShowWhenReady(enable: false)
        if let tappxKey = tappxKey {
            let settings = TappxSettings()
            settings.setKeywords(keywords: [tappxKey])
            self.rewardedAd?.load(settings: settings)
            return
        }
        
        self.rewardedAd?.load()
    }
    
    func isReady() {
        let readyStatus = String(self.rewardedAd?.isReady() ?? false)
        self.textState = "rewarded".localized + "status.ready".localized + readyStatus + "\n" + textState
    }
    
    func show() {
        self.rewardedAd?.show(from: nil)
    }
    
}


extension RewardedAd: TappxRewardedAdDelegate {
    func tappxRewardedAdDidFinishLoad(rewardedAd: TappxRewardedAd) {
        self.textState = "rewarded".localized + "status.loaded".localized + "\n" + textState
    }
    
    func tappxRewardedAdClicked(rewardedAd: TappxRewardedAd) {
        self.textState = "rewarded".localized + "status.clicked".localized + "\n" + textState
        
    }
    
    func tappxRewardedAdDismissed(rewardedAd: TappxRewardedAd) {
        self.rewardedAd = nil
        self.textState = "rewarded".localized + "status.dismissed".localized + "\n" + textState
    }
    
    func tappxRewardedAdDidAppear(rewardedAd: TappxRewardedAd) {
        self.textState = "rewarded".localized + "status.appeared".localized + "\n" + textState
    }
    
    func tappxRewardedAdVideoClosed(rewardedAd: TappxRewardedAd) {
        self.textState = "rewarded".localized + "status.closed".localized + "\n" + textState
    }
    
    func tappxRewardedAdPlaybackFailed(rewardedAd: TappxRewardedAd) {
        self.textState = "rewarded".localized + "status.playbackfailed".localized + "\n" + textState
    }
    
    func tappxRewardedAdVideoCompleted(rewardedAd: TappxRewardedAd) {
        self.textState = "rewarded".localized + "status.completed".localized + "\n" + textState
    }
    
    func tappxRewardedAdUserDidEarnReward(rewardedAd: TappxRewardedAd) {
        self.textState = "reward".localized + "\n" + textState
    }
    
    func tappxRewardedAdDidFail(rewardedAd: TappxRewardedAd, error: TappxErrorAd) {
        self.rewardedAd = nil
        let errorMessage = TappxErrorManager.message(for: error.code)
        self.textState = "rewarded".localized + "status.failed".localized + errorMessage + "\n" + textState
    }
    
}
