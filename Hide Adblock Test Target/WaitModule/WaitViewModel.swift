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
    
    var coordinatorDelegate: MainCoordinator?
    private let model: WaitModel
    
    init(model: WaitModel) {
        self.model = model
        self.model.$onboarding
            .assign(to: &self.$onboarding)
    }
    
    @Published var onboarding = Onboarding()
    var subscripitons = Set<AnyCancellable>()
    
    func goToOnboarding() -> some View {
        self.coordinatorDelegate?.goToOnboarding(self.onboarding)
    }
    
}
