//
//  LikeItem.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import SwiftUI

struct LikeItem: View {
    let product: Product
    
    var body: some View {
        HStack {
            Image("customHeart")
                .resizable()
                .scaledToFit()
                .frame(width: 14)
            
            Text("\(product.likes)")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
        .background(Color.white)
        .clipShape(Capsule())
        
    }
}

#Preview {
    LikeItem(product: .preview)
        .background(Color.black)
}
