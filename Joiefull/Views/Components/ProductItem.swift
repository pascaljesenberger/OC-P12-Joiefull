//
//  CategoryItem.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import SwiftUI

struct ProductItem: View {
    let product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .bottomTrailing) {
                AsyncImage(url: URL(string: product.picture.url)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray.opacity(0.2)
                }
                .frame(height: 198)
                .frame(maxWidth: 198)
                .clipped()
                .cornerRadius(20)
                
                LikeItem(product: product)
                    .padding(8)
            }

            ProductInfo(product: product)
        }
        .frame(width: 198)
    }
}

#Preview {
    ProductItem(product: .preview)
}
