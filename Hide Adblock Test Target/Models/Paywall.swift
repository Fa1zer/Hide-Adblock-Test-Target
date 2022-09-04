//
//  Paywall.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 04.09.2022.
//

import Foundation
import ParseSwift

struct Paywall: ParseObject {
    var originalData: Data?
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var title: String?
    var firstColorHEX: String?
    var firstColorLocations: Float?
    var secondColorHEX: String?
    var secondColorLocation: Float?
    var imageBase64: String?
}
