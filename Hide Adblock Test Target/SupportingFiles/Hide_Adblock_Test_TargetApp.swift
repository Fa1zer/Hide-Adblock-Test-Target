//
//  Hide_Adblock_Test_TargetApp.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 04.09.2022.
//

import SwiftUI
import ParseSwift

@main
struct Hide_Adblock_Test_TargetApp: App {
    
    init() {
        ParseSwift.initialize(configuration: ParseConfiguration(
            applicationId: applicationId,
            clientKey: clientKey,
            serverURL: URL(string: server) ?? URL(fileURLWithPath: "")
        ))
    }
    
    var body: some Scene {
        WindowGroup {
            MainCoordinator().start()
        }
    }
    
}
