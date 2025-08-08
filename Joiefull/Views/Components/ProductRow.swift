//
//  ProductRow.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import SwiftUI

struct ProductRow: View {
    let category: Category
    let products: [Product]

    var body: some View {
        VStack(alignment: .leading) {
            Text(category.displayName)
                .font(.system(size: 22, weight: .semibold))
                .foregroundColor(.black)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(products) { product in
                        ProductItem(product: product)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
