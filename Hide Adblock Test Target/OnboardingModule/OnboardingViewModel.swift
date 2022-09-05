//
//  OnboardingViewModel.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 05.09.2022.
//

import Foundation
import Combine
import SwiftUI

final class OnboardingViewModel: MainCoordinatable, ObservableObject {
    
    var coordinatorDelegate: MainCoordinator?
    var callBack: (() -> Void)?
    let onboarding: Onboarding
    private let model: OnboardingModel
    
    init(model: OnboardingModel, onboarding: Onboarding) {
        self.model = model
        self.onboarding = onboarding
    }
    
    deinit {
        self.subscriptions.forEach { $0.cancel() }
    }
    
    @Published var paywall: Paywall? {
        didSet {
            self.callBack?()
        }
    }
    
    private var subscriptions = Set<AnyCancellable>()
    
    func goToPaywall() -> some View {
        self.coordinatorDelegate?.goToPaywall(self.paywall ?? Paywall())
    }
    
    func getPaywall() {
        self.model.getPaywall()
            .sink { paywall in
                self.paywall = paywall
            }
            .store(in: &self.subscriptions)
    }
    
}
