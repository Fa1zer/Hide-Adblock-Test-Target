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
    private var someScreens = [SomeScreen]()
    
    func start() -> some View {
        self.getSomeScreens()
            .sink { [ weak self ] screens in
                self?.someScreens = screens
            }
            .store(in: &self.subscriptions)
        
        return self.goToWait()
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
        let viewModel = OnboardingViewModel(model: OnboardingModel(), onboarding: view)
        
        viewModel.coordinatorDelegate = self
        
        return OnboardingView(viewModel: viewModel)
    }
    
    func goToPaywall(_ view: Paywall) -> some View {
        let viewModel = PaywallViewModel(model: PaywallModel(), paywall: view)
        
        viewModel.coordinatorDelegate = self
        viewModel.someScreensIsEmpty = self.someScreens.isEmpty
        
        return PaywallView(viewModel: viewModel)
    }
    
    func goToSomeScreens() -> some View {
        return SomeViewCoordinator(views: self.someScreens).start()
    }
    
    private func getOnboarding() -> AnyPublisher<Onboarding, Never> {
        ParseManager.last()
    }
    
    private func getSomeScreens() -> AnyPublisher<[SomeScreen], Never> {
        ParseManager.all()
    }
    
}
