//
//  WaitViewModel.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 04.09.2022.
//

import Foundation
import Combine
import SwiftUI

final class WaitViewModel: MainCoordinatable, ObservableObject {
    
    var callBack: (() -> Void)?
    var coordinatorDelegate: MainCoordinator?
    @ObservedObject private var model: WaitModel
    
    init(model: WaitModel) {
        self.model = model
        
        self.model.$onboarding
            .assign(to: \.onboarding, on: self)
            .store(in: &self.subscriptions)
    }
    
    @Published var onboarding: Onboarding? {
        didSet {
            self.callBack?()
        }
    }
    
    private var subscriptions = Set<AnyCancellable>()
    
    func goToOnboarding() -> some View {
        self.coordinatorDelegate?.goToOnboarding(self.onboarding ?? Onboarding())
    }
    
}
