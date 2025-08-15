//
//  NavigableProductImage.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 14/08/2025.
//

import SwiftUI

struct NavigableProductImage: View {
    let product: Product
    let sizeCategory: ContentSizeCategory
    let device: UIDevice
    let imageSize: CGFloat?
    @Binding var imageLoaded: Bool
    
    var body: some View {
        NavigationLink(destination: ProductDetailView(product: product)) {
            ProductImage(
                product: product,
                sizeCategory: sizeCategory,
                device: device,
                imageSize: imageSize,
                imageLoaded: $imageLoaded
            )
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    NavigableProductImage(
        product: .preview,
        sizeCategory: .medium,
        device: UIDevice.current,
        imageSize: 198,
        imageLoaded: .constant(true)
    )
}
