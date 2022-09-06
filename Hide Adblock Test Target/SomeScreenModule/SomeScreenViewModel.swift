//
//  SomeScreenViewModel.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 06.09.2022.
//

import Foundation
import SwiftUI

final class SomeScreenViewModel: SomeViewCoordinatable {
    
    var coordinatorDelegate: SomeViewCoordinator?
    let someScreenNode: Node<SomeScreen>
    private let model: SomeScreenModel
    
    init(model: SomeScreenModel, someScreenNode: Node<SomeScreen>) {
        self.someScreenNode = someScreenNode
        self.model = model
    }
    
    func goToSomeScreen() -> some View {
        self.coordinatorDelegate?.go(to: someScreenNode.next ?? Node(value: SomeScreen()))
    }
}
