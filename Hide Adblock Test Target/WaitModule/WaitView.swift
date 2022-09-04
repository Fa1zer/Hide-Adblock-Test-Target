//
//  WaitView.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 04.09.2022.
//

import SwiftUI

struct WaitView: View {
    
    @ObservedObject private var viewModel: WaitViewModel
    @State private var isGoToOnboarding = false
    
    init(viewModel: WaitViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ProgressView()
                .scaleEffect(2.0, anchor: .center)
                .frame(width: 50, height: 50)
            
            NavigationLink(
                destination: Text(String()),
                isActive: self.$isGoToOnboarding
            ) {
                EmptyView()
            }
            .hidden()
        }
    }
    
}

struct WaitView_Previews: PreviewProvider {
    static var previews: some View {
        WaitView(viewModel: WaitViewModel(model: WaitModel()))
    }
}
