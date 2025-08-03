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
            AsyncImage(url: URL(string: product.picture.url)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.2)
            }
            .frame(height: 198)
            .frame(maxWidth: 200)
            .clipped()
            .cornerRadius(16)

            ProductInfo(product: product)
        }
        .frame(width: 200)
    }
}
