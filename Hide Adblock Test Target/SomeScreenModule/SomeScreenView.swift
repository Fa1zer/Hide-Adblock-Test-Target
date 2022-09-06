//
//  SomeScreenView.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 06.09.2022.
//

import SwiftUI

struct SomeScreenView: View {
    
    private let viewModel: SomeScreenViewModel
    
    init(viewModel: SomeScreenViewModel) {
        self.viewModel = viewModel
    }
    
    @State private var isGoToSomeScreen = false
    @State private var isHidden = true
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    LinearGradient(
                        colors: [
                            self.viewModel.someScreenNode.value.firstColorHEX != nil ? Color(
                                hex: self.viewModel.someScreenNode.value.firstColorHEX ?? ""
                            ) : .darkPurple,
                            self.viewModel.someScreenNode.value.secondColorHEX != nil ? Color(
                                hex: self.viewModel.someScreenNode.value.secondColorHEX ?? ""
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
                            if self.viewModel.someScreenNode.next != nil {
                                self.isGoToSomeScreen = true
                            }
                        } label: {
                            HStack {
                                Spacer()
                                
                                if let hex = self.viewModel.someScreenNode.value.buttonColorHEX {
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
                    
                    NavigationLink(isActive: self.$isGoToSomeScreen) {
                        self.viewModel.goToSomeScreen()
                    } label: {
                        EmptyView()
                    }
                    .hidden()
                }
            }
            .navigationBarHidden(true)
        }
    }
    
}

struct SomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SomeScreenView(viewModel: SomeScreenViewModel(
            model: SomeScreenModel(),
            someScreenNode: Node(value: SomeScreen())
        ))
    }
}
