//
//  SomeViewCoordinator.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 04.09.2022.
//

import Foundation
import SwiftUI

protocol SomeViewCoordinatable {
    var coordinatorDelegate: SomeViewCoordinator? { get set }
}

final class SomeViewCoordinator {
    
    private let someViewsList: LinkedList<SomeScreen>
    
    init(views: [SomeScreen]) {
        self.someViewsList = LinkedList(elements: views)
    }
    
    func start() -> some View {
        if let view = self.someViewsList.first {
            return AnyView(self.go(to: view))
        }
        
        return AnyView(EmptyView())
    }
    
    func go(to view: Node<SomeScreen>) -> some View {
        let viewModel = SomeScreenViewModel(model: SomeScreenModel(), someScreenNode: view)
        
        viewModel.coordinatorDelegate = self
        
        return SomeScreenView(viewModel: viewModel)
    }
    
}
