//
//  OnboardingModel.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 05.09.2022.
//

import Foundation
import Combine

final class OnboardingModel: ObservableObject {
        
    func getPaywall() -> AnyPublisher<Paywall, Never> {
        ParseManager.last()
    }
    
}
