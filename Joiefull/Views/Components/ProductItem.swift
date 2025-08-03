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
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: product.picture.url)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.2)
            }
            .frame(width: 198, height: 198)
            .cornerRadius(16)

            Text(product.name)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black)
        }
    }
}
