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
    @Environment(\.sizeCategory) private var sizeCategory
    private let device = UIDevice.current
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(category.displayName)
                .font(.system(size: ResponsiveSizes.fontSize(22, for: sizeCategory, device: device), weight: .semibold))
                .foregroundColor(.black)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: ResponsiveSizes.fontSize(8, for: sizeCategory, device: device)) {
                    ForEach(products) { product in
                        ProductItem(product: product)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ProductRow(category: .accessories, products: [.preview])
}
