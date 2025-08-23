//
//  NavigableProductImage.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 14/08/2025.
//

import SwiftUI

struct NavigableProductImage: View {
    let product: Product
    @EnvironmentObject private var deviceEnvironment: DeviceEnvironment
    let isDetailView: Bool
    @Binding var imageLoaded: Bool
    @Binding var selectedProduct: Product?
    
    var body: some View {
        Group {
            if deviceEnvironment.isIpad {
                Button(action: {
                    if selectedProduct?.id == product.id {
                        selectedProduct = nil
                    } else {
                        selectedProduct = product
                    }
                }) {
                    ProductImage(
                        product: product,
                        isDetailView: isDetailView,
                        imageLoaded: $imageLoaded
                    )
                }
            } else {
                NavigationLink(
                    destination: ProductDetailView(product: product, selectedProduct: .constant(nil))
                ) {
                    ProductImage(
                        product: product,
                        isDetailView: isDetailView,
                        imageLoaded: $imageLoaded
                    )
                }
            }
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    NavigableProductImage(
        product: .preview,
        isDetailView: false,
        imageLoaded: .constant(true),
        selectedProduct: .constant(nil)
    )
    .environmentObject(DeviceEnvironment())
}
