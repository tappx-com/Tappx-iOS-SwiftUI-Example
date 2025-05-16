//
//  UIFontExtension.swift
//  TappxSwiftUIExample
//
//  Created by Sara on 9/5/25.
//

import SwiftUI

extension Font {
    static func titleFont() -> Font {
        return Font.custom("IBMPlexSans-SemiBold", size: 22)
    }
    
    static func bodyFont() -> Font {
        return Font.custom("IBMPlexSans-Medium", size: 18)
    }
    
    static func headerFont() -> Font {
        return Font.custom("ReneBieder-FaktumSemiBold", size: 26)
    }
    
    static func secondFont() -> Font {
        return Font.custom("IBMPlexSans-Medium", size: 16)
    }
}
