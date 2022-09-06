//
//  OnboardingView.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 05.09.2022.
//

import SwiftUI

struct OnboardingView: View {
    
    @ObservedObject private var viewModel: OnboardingViewModel
    @State private var isGoToPaywallReady = false
    @State private var isHidden = true
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    LinearGradient(
                        colors: [
                            self.viewModel.onboarding.firstColorHEX != nil ? Color(
                                hex: self.viewModel.onboarding.firstColorHEX ?? ""
                            ) : .darkPurple,
                            self.viewModel.onboarding.secondColorHEX != nil ? Color(
                                hex: self.viewModel.onboarding.secondColorHEX ?? ""
                            ) : .prettyPurple
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
                    
                    VStack {
                        Image("logo")
                            .padding(.top, -70)
                        
                        Spacer()
                                            
                        Button {
                            self.isHidden = false
                            self.viewModel.getPaywall()
                        } label: {
                            HStack {
                                Spacer()
                                
                                if let hex = self.viewModel.onboarding.buttonColorHEX {
                                    Color(hex: hex).ignoresSafeArea()
                                } else {
                                    Color(red: 0.638, green: 1, blue: 0.579)
                                        .ignoresSafeArea()
                                }
                                
                                Spacer()
                            }
                        }
                        .frame(
                            width: geometry.size.width - 76,
                            height: geometry.size.width - 76
                        )
                        .padding(.bottom, 70)
                        .overlay {
                            if !self.isHidden {
                                ProgressView()
                                    .progressViewStyle(.circular)
                                    .frame(width: 50, height: 50)
                                    .scaleEffect(2.0, anchor: .center)
                                    .padding(.bottom, 50)
                            }
                        }
                        
                        Spacer()
                    }
                    
                    NavigationLink(isActive: self.$isGoToPaywallReady) {
                        self.viewModel.goToPaywall()
                    } label: {
                        EmptyView()
                    }
                    .hidden()
                }
            }
            .navigationBarHidden(true)
            .onAppear {
                self.viewModel.callBack = {
                    if self.viewModel.paywall != nil {
                        self.isGoToPaywallReady = true
                    }
                }
            }
        }
    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: OnboardingViewModel(model: OnboardingModel(), onboarding: Onboarding()))
            .previewInterfaceOrientation(.portrait)
    }
}
