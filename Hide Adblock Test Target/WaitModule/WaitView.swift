//
//  WaitView.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 04.09.2022.
//

import SwiftUI
import Combine

struct WaitView: View {
    
    @ObservedObject private var viewModel: WaitViewModel
    
    init(viewModel: WaitViewModel) {
        self.viewModel = viewModel
    }
    
    @State private var isGoToOnboarding = false
    private var subscriptions = Set<AnyCancellable>()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemBackground).ignoresSafeArea()
                
                ProgressView()
                    .scaleEffect(2.0, anchor: .center)
                    .frame(width: 50, height: 50)
                
                NavigationLink(isActive: self.$isGoToOnboarding) {
                    self.viewModel.goToOnboarding()
                } label: {
                    EmptyView()
                }
                .hidden()
            }
        }
        .onAppear() {
            self.viewModel.callBack = {
                var result = self
                
                self.viewModel.$onboarding
                    .sink { _ in
                        if self.viewModel.onboarding != nil {
                            self.isGoToOnboarding = true
                        }
                    }
                    .store(in: &result.subscriptions)
                
                if self.viewModel.onboarding != nil {
                    self.isGoToOnboarding = true
                }
            }
        }
    }
        
}

struct WaitView_Previews: PreviewProvider {
    static var previews: some View {
        WaitView(viewModel: WaitViewModel(model: WaitModel()))
    }
}
