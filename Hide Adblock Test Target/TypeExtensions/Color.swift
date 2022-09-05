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
            red: Double(r / 255),
            green: Double(g / 255),
            blue: Double(b / 255),
            opacity: Double(a / 100)
        )
    }
    
}

extension Color {
    
    static let darkPurple = Color(r: 27, g: 19, b: 85)
    static let pretyPurple = Color(r: 104, g: 30, b: 156)
    
}
