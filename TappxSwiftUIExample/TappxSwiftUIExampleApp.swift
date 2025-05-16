//
//  TappxSwiftUIExampleApp.swift
//  TappxSwiftUIExample
//
//  Created by Sara Diaz Perez on 9/5/25.
//

import SwiftUI
import TappxFramework

@main
struct TappxSwiftUIExampleApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .navigationViewStyle(.stack)
                .onAppear {
                    setupTappxSDK()
                }
        }
    }
    
    private func setupTappxSDK() {
        TappxFramework.add(tappxKey: Constants.Tappx.appKey, testMode: Constants.Tappx.useTestAds)
        TappxFramework.set(endpoint: Constants.Tappx.endpoint)
    }
}
