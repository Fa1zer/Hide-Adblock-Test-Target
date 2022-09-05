//
//  Color.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 05.09.2022.
//

import Foundation
import SwiftUI

extension Color {
    
    init(r: Int, g: Int, b: Int, a: Int = 100) {
        self.init(
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 100
        )
    }
    
    init(hex: UInt, alpha: Double = 1) {
            self.init(
                .sRGB,
                red: Double((hex >> 16) & 0xff) / 255,
                green: Double((hex >> 08) & 0xff) / 255,
                blue: Double((hex >> 00) & 0xff) / 255,
                opacity: alpha
            )
        }
    
}

extension Color {
    
    static let darkPurple = Color(uiColor: #colorLiteral(red: 0.1058823529, green: 0.07450980392, blue: 0.3333333333, alpha: 1))
    static let pretyPurple = Color(uiColor: #colorLiteral(red: 0.4078431373, green: 0.1176470588, blue: 0.6117647059, alpha: 1))
    
}
