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
    let detailViewWidth: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(category.displayName)
                .font(.system(size: deviceEnvironment.fontSize(22), weight: .semibold))
                .foregroundColor(.black)
                .padding(.horizontal)
                .accessibilityAddTraits(.isHeader)
                .accessibilityLabel("Catégorie \(category.displayName), \(products.count) produit\(products.count > 1 ? "s" : "")")
            
            ScrollViewReader { scrollProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: deviceEnvironment.fontSize(8)) {
                        ForEach(products) { product in
                            ProductItem(
                                product: product,
                                selectedProduct: $selectedProduct
                            )
                            .id(product.id)
                        }
                    }
                    .padding(.horizontal)
                    .background(
                        GeometryReader { geometry in
                            Color.clear
                                .preference(
                                    key: ScrollOffsetPreferenceKey.self,
                                    value: geometry.frame(in: .named("scroll")).origin
                                )
                        }
                    )
                }
                .coordinateSpace(name: "scroll")
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    if value.x < -detailViewWidth && detailViewWidth > 0 {
                        withAnimation {
                            scrollProxy.scrollTo(products.first?.id, anchor: .leading)
                        }
                    }
                }
            }
            .accessibilityLabel("Liste horizontale des produits \(category.displayName)")
            .accessibilityHint("Balayez vers la droite ou la gauche pour naviguer entre les produits")
        }
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
        value = nextValue()
    }
}

#Preview {
    ScrollView {
        ProductRow(
            category: .accessories,
            products: [.preview],
            selectedProduct: .constant(nil),
            detailViewWidth: 0
        )
        .environmentObject(DeviceEnvironment())
    }
}
