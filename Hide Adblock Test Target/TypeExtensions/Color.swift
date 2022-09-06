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
    
    init(hex: String, alpha: Double = 1) {
        self.init(UIColor.hexStringToUIColor(hex: hex))
    }
    
}

extension Color {
    
    static let darkPurple = Color(uiColor: #colorLiteral(red: 0.1058823529, green: 0.07450980392, blue: 0.3333333333, alpha: 1))
    static let prettyPurple = Color(uiColor: #colorLiteral(red: 0.4078431373, green: 0.1176470588, blue: 0.6117647059, alpha: 1))
    static let prettyGreen = Color(hex: "#16D077")
    static let somePurple = Color(hex: "#9918FF")
    
}
