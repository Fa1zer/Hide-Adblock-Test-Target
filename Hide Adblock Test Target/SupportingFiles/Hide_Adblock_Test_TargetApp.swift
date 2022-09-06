//
//  Hide_Adblock_Test_TargetApp.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 04.09.2022.
//

import SwiftUI
import ParseSwift
import AppCenter
import AppCenterCrashes
import AppCenterAnalytics

@main
struct Hide_Adblock_Test_TargetApp: App {
    
    init() {
        ParseSwift.initialize(configuration: ParseConfiguration(
            applicationId: applicationId,
            clientKey: clientKey,
            serverURL: URL(string: server) ?? URL(fileURLWithPath: "")
        ))
        
        AppCenter.start(withAppSecret: appSecret, services: [
            Analytics.self,
            Crashes.self
        ])
    }
    
    var body: some Scene {
        WindowGroup {
            MainCoordinator().start()
        }
    }
    
}
