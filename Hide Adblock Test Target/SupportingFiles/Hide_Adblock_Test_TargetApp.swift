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
import AppCenterDistribute

@main
struct Hide_Adblock_Test_TargetApp: App {
    
    init() {
        Distribute.updateTrack = .private
        
        ParseSwift.initialize(configuration: ParseConfiguration(
            applicationId: applicationId,
            clientKey: clientKey,
            serverURL: URL(string: server) ?? URL(fileURLWithPath: "")
        ))
        
        #if DEBUG
        AppCenter.start(withAppSecret: appSecret, services: [
            Analytics.self,
            Crashes.self,
            Distribute.self
        ])
        #else
        AppCenter.start(withAppSecret: appSecret, services: [
            Analytics.self,
            Crashes.self
        ])
        #endif
        
        Distribute.checkForUpdate()
    }
    
    var body: some Scene {
        WindowGroup {
            MainCoordinator().start()
        }
    }
    
}
