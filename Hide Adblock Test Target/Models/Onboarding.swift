//
//  Onboarding.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 04.09.2022.
//

import Foundation
import ParseSwift

struct Onboarding: ParseObject {
    var originalData: Data?
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var buttonColorHEX: String?
    var firstColorHEX: String?
    var firstColorLocations: Float?
    var secondColorHEX: String?
    var secondColorLocation: Float?
}
