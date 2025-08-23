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
    @Binding var selectedProduct: Product?
    @EnvironmentObject private var deviceEnvironment: DeviceEnvironment
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(category.displayName)
                .font(.system(size: deviceEnvironment.fontSize(22), weight: .semibold))
                .foregroundColor(.black)
                .padding(.horizontal)
                .accessibilityAddTraits(.isHeader)
                .accessibilityLabel("Catégorie \(category.displayName), \(products.count) produit\(products.count > 1 ? "s" : "")")
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: deviceEnvironment.fontSize(8)) {
                    ForEach(products) { product in
                        ProductItem(product: product, selectedProduct: $selectedProduct)
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
        ProductRow(category: .accessories, products: [.preview], selectedProduct: .constant(nil))
            .environmentObject(DeviceEnvironment())
    }
}
