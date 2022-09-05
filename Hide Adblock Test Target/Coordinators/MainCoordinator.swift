//
//  MainCoordinator.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 04.09.2022.
//

import Foundation
import SwiftUI
import Combine
import ParseSwift

protocol MainCoordinatable {
    var coordinatorDelegate: MainCoordinator? { get set }
}

final class MainCoordinator {
    
    deinit {
        self.subscriptions.forEach { $0.cancel() }
    }
    
    private var subscriptions = Set<AnyCancellable>()
    
    func start() -> some View {
        self.goToWait()
    }
    
    func goToWait() -> some View {
        let model = WaitModel()
        let viewModel = WaitViewModel(model: model)
        
        viewModel.coordinatorDelegate = self
        
        self.getOnboarding()
            .sink { onboarding in
                model.onboarding = onboarding
            }
            .store(in: &self.subscriptions)
        
        return WaitView(viewModel: viewModel)
    }
    
    func goToOnboarding(_ view: Onboarding) -> some View {
        let model = OnboardingModel()
        let viewModel = OnboardingViewModel(model: model, onboarding: view)
        
        viewModel.coordinatorDelegate = self
        
        return OnboardingView(viewModel: viewModel)
    }
    
    func goToPaywall(_ view: Paywall) -> some View {
//        go to paywall
        
        EmptyView()
    }
    
    private func getOnboarding() -> AnyPublisher<Onboarding, Never> {
        ParseManager.last()
    }
    
}
