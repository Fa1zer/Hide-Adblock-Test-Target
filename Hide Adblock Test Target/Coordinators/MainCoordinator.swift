//
//  MainCoordinator.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 04.09.2022.
//

import Foundation
import SwiftUI
import Combine

protocol MainCoordinatable {
    var coordinatorDelegate: MainCoordinator? { get set }
}

final class MainCoordinator {
    
    func start() -> some View {
        self.goToWait()
    }
    
    func goToWait() -> some View {
        let viewModel = WaitViewModel(model: WaitModel())
        
        viewModel.coordinatorDelegate = self
        
        return WaitView(viewModel: viewModel)
    }
    
    private func getOnboarding() -> AnyPublisher<Onboarding, Never> {
        ParseManager.first()
    }
    
}
