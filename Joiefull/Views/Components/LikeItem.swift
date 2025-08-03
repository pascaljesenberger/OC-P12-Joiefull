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
            Text("\(product.likes)")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black)
            
            Image("customHeart")
                .resizable()
                .scaledToFit()
                .frame(width: 12)
        }
    }
}

#Preview {
    LikeItem(product: .preview)
}
