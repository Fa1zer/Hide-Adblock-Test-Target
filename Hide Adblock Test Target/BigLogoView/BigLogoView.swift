//
//  BigLogoView.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 05.09.2022.
//

import SwiftUI
import UIKit

struct BigLogoView: View {
    let image: UIImage?
    
    init(image: Data? = nil) {
        if let image = image {
            self.image = UIImage(data: image)
        } else {
            self.image = UIImage(named: "big logo")
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0) {
                Text("Remove ads")
                    .font(.system(size: 35).bold())
                    .foregroundColor(.white)
                            
                ZStack(alignment: .center) {
                    Image(uiImage: self.image ?? UIImage(named: "big logo") ?? UIImage())
                        .resizable()
                        .frame(width: geometry.size.width, height: geometry.size.width)
                                    
                    VStack {
                        Text("3 DAYS FREE")
                            .font(.system(size: 20))
                            .foregroundColor(Color(uiColor: UIColor(
                                red: 0.085,
                                green: 0.817,
                                blue: 0.465,
                                alpha: 1
                            )))
                        
                        Spacer()
                                            
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(alignment: .center, spacing: 12) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.prettyPurple)
                                Text("Auto-renewal")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                            }
                            
                            HStack(alignment: .center, spacing: 12) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.prettyPurple)
                                Text("Cancel at any time")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.bottom, 17)
                    }
                }
            }
            .fixedSize()
        }
    }
    
}

struct BigLogoView_Previews: PreviewProvider {
    static var previews: some View {
        BigLogoView().background(.black)
    }
}
