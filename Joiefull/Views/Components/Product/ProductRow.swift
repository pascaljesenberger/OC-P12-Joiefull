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
    let imageSize: CGFloat?
    let isNavigationEnabled: Bool
    
    init(category: Category, products: [Product], imageSize: CGFloat? = 198, isNavigationEnabled: Bool = true) {
        self.category = category
        self.products = products
        self.imageSize = imageSize
        self.isNavigationEnabled = isNavigationEnabled
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(category.displayName)
                .font(.system(size: ResponsiveSizes.fontSize(22, for: sizeCategory, device: device), weight: .semibold))
                .foregroundColor(.black)
                .padding(.horizontal)
                .accessibilityAddTraits(.isHeader)
                .accessibilityLabel("Catégorie \(category.displayName), \(products.count) produit\(products.count > 1 ? "s" : "")")
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: ResponsiveSizes.fontSize(8, for: sizeCategory, device: device)) {
                    ForEach(products) { product in
                        ProductItem(
                            product: product
                        )
                    }
                }
                .padding(.horizontal)
            }
            .accessibilityLabel("Liste horizontale des produits \(category.displayName)")
            .accessibilityHint("Balayez vers la droite ou la gauche pour naviguer entre les produits")
        }
    }
}

#Preview {
    ScrollView {
        ProductRow(category: .accessories, products: [.preview], imageSize: 198, isNavigationEnabled: false)
    }
}
