//
//  ProductInfo.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import SwiftUI

struct ProductInfo: View {
    let product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .top) {
                Text(product.name)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)

                Spacer()

                Image("customStar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12)
            }

            HStack {
                Text(String(format: "%.2f €", product.price))
                    .font(.system(size: 14))
                    .foregroundColor(.black)

                Spacer()

                if product.original_price > product.price {
                    Text(String(format: "%.2f €", product.original_price))
                        .font(.system(size: 14))
                        .strikethrough()
                        .foregroundColor(.black.opacity(0.7))
                }
            }
        }
        .padding(.horizontal)
    }
}


#Preview {
    ProductInfo(product: .preview)
}  
