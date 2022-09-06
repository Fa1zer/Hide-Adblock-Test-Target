//
//  PaywallViewModel.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 05.09.2022.
//

import Foundation
import SwiftUI

final class PaywallViewModel: MainCoordinatable {
    
    var coordinatorDelegate: MainCoordinator?
    let paywall: Paywall
    private let model: PaywallModel
    
    init(model: PaywallModel, paywall: Paywall) {
        self.model = model
        self.paywall = paywall
    }
    
    var someScreensIsEmpty = true
    
    func goToSomeScreens() -> some View {
        self.coordinatorDelegate?.goToSomeScreens()
    }
    
}
