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
    
    var body: some View {
        NavigationLink(destination: ProductDetailView(product: product)) {
            ProductImage(
                product: product,
                isDetailView: isDetailView,
                imageLoaded: $imageLoaded
            )
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    NavigableProductImage(
        product: .preview,
        isDetailView: false,
        imageLoaded: .constant(true)
    )
    .environmentObject(DeviceEnvironment())
}
