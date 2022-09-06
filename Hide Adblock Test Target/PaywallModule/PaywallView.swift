//
//  PaywallView.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 05.09.2022.
//

import SwiftUI

struct PaywallView: View {
    
    private let viewModel: PaywallViewModel
    
    init(viewModel: PaywallViewModel) {
        self.viewModel = viewModel
    }
    
    @State private var isGoToSomeScreens = false
    @State private var isSelectedFirst = true
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    LinearGradient(
                        colors: [
                            self.viewModel.paywall.firstColorHEX != nil ? Color(
                                hex: self.viewModel.paywall.firstColorHEX ?? ""
                            ) : .darkPurple,
                            self.viewModel.paywall.secondColorHEX != nil ? Color(
                                hex: self.viewModel.paywall.secondColorHEX ?? ""
                            ) : .prettyPurple
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .center, spacing: 8) {
                            Image("logo")
                                .padding(.top, -70)
                            
                            BigLogoView(
                                image: self.viewModel.paywall.imageBase64 != nil ?
                                Data(base64Encoded: self.viewModel.paywall.imageBase64 ?? "") : nil
                            )
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(alignment: .center, spacing: 21) {
                                    Spacer()
                                    
                                    Spacer()
                                    
                                    self.firstItem.padding(.leading, 10)
                                    
                                    self.secondItem
                                }
                            }
                            
                            Spacer()
                            
                            Spacer()
                            
                            Button {
                                if !self.viewModel.someScreensIsEmpty {
                                    self.isGoToSomeScreens = true
                                }
                            } label: {
                                HStack(alignment: .center) {
                                    Spacer()
                                    
                                    Text(self.viewModel.paywall.title ?? "TRY FOR FREE")
                                        .font(.system(size: 14).bold())
                                        .foregroundColor(.white)
                                        .frame(height: 48)
                                    
                                    Spacer()
                                }
                                .background(Color.prettyGreen)
                                .cornerRadius(10)
                            }
                            .padding([.leading, .trailing], 20)
                            
                            Spacer()
                            
                            Spacer()
                            
                            HStack {
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Text("Policy")
                                        .font(.system(size: 13))
                                        .underline()
                                        .foregroundColor(.white)
                                }
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Text("EULA")
                                        .font(.system(size: 13))
                                        .underline()
                                        .foregroundColor(.white)
                                }
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Text("Restore")
                                        .font(.system(size: 13))
                                        .underline()
                                        .foregroundColor(.white)
                                }
                                
                                Spacer()
                            }
                        }
                        .frame(height: 743)
                    }
                    
                    NavigationLink(isActive: self.$isGoToSomeScreens) {
                        self.viewModel.goToSomeScreens()
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

struct PaywallView_Previews: PreviewProvider {
    static var previews: some View {
        PaywallView(viewModel: PaywallViewModel(model: PaywallModel(), paywall: Paywall()))
    }
}

extension PaywallView {
    
    private var firstItem: some View {
        ZStack {
            VStack(alignment: .center, spacing: 8) {
                Text("WEEK")
                    .font(.system(size: 20).bold())
                    .foregroundColor(.white)
                
                Text("$9,99")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
            }
            .frame(width: 137, height: 92)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(
                self.isSelectedFirst ? Color.prettyGreen : .somePurple,
                lineWidth: 3
            ))
            
            VStack {
                Text("Best choise")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .frame(width: 97, height: 21, alignment: .center)
                    .background(
                        self.isSelectedFirst ? Color.prettyGreen : .somePurple
                    )
                    .cornerRadius(8)
                    .padding(.bottom, -20)
                
                Spacer()
            }
        }
        .frame(height: 112)
        .fixedSize()
        .onTapGesture {
            self.isSelectedFirst = true
        }
    }
    
    private var secondItem: some View {
        ZStack {
            VStack(alignment: .center, spacing: 8) {
                Text("YEARS")
                    .font(.system(size: 20).bold())
                    .foregroundColor(.white)
                
                Text("$79,99")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
            }
            .frame(width: 137, height: 92)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(
                !self.isSelectedFirst ? Color.prettyGreen : .somePurple,
                lineWidth: 3
            ))
        }
        .frame(height: 112)
        .fixedSize()
        .onTapGesture {
            self.isSelectedFirst = false
        }
    }
    
}
