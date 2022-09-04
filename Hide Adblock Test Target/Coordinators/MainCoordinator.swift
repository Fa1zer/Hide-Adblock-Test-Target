//
//  MainCoordinator.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 04.09.2022.
//

import Foundation
import SwiftUI

protocol MainCoorditable {
    var coordinatorDelegate: MainCoordinator? { get set }
}

final class MainCoordinator {
    
    func start() -> some View {
        self.goToWait()
    }
    
    func goToWait() -> some View {
//        return wait view
    }
    
}
