//
//  Color-Theme.swift
//  TappxSwiftUIExample
//
//  Created by Sara on 9/5/25.
//

import SwiftUI

struct ColorTheme {
    static let primary = Color(UIColor(hex: "#ff0d58") ?? .systemPink) // Pink
    static let primaryVariant = Color(UIColor(hex: "#330032") ?? .purple) // Purple
    static let secondary = Color(UIColor(hex: "#f2f2f2") ?? .gray) // Gray
    static let secondaryVariant = Color(UIColor(hex: "#ffffff") ?? .white) // White
    static let scrollBackground = Color(UIColor(hex: "#333333") ?? .darkGray) // Dark grey
    static let darkGray = Color(UIColor(hex: "#e0e0e0") ?? .gray)// Gray
    static let switchOn = Color(UIColor(hex: "#7ce080") ?? .green) // Green
    static let switchOff = Color(UIColor(hex: "#606060") ?? .darkGray) // Gray
    
}


extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                if hexColor.count == 8 {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                } else if hexColor.count == 6 {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
                    a = 1.0
                } else {
                    return nil
                }
                
                self.init(red: r, green: g, blue: b, alpha: a)
                return
            }
        }
        return nil
    }
}
