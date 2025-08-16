//
//  ProductImage.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 14/08/2025.
//

import SwiftUI

struct ProductImage: View {
    let product: Product
    let sizeCategory: ContentSizeCategory
    let device: UIDevice
    let imageSize: CGFloat?
    @Binding var imageLoaded: Bool
    
    var body: some View {
        AsyncImage(url: URL(string: product.picture.url)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(
                    maxWidth: imageSize != nil ? ResponsiveSizes.imageSize(imageSize!, for: sizeCategory, device: device) : nil,
                    maxHeight: imageSize != nil ? ResponsiveSizes.imageSize(imageSize!, for: sizeCategory, device: device) : nil
                )
                .frame(maxWidth: .infinity)
                .clipped()
                .onAppear { imageLoaded = true }
        } placeholder: {
            ZStack {
                RoundedRectangle(cornerRadius: ResponsiveSizes.imageSize(20, for: sizeCategory, device: device))
                    .fill(Color.gray.opacity(0.3))
                    .frame(
                        maxWidth: imageSize != nil ? ResponsiveSizes.imageSize(imageSize!, for: sizeCategory, device: device) : nil,
                        maxHeight: imageSize != nil ? ResponsiveSizes.imageSize(imageSize!, for: sizeCategory, device: device) : nil
                    )
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .accessibilityLabel("Chargement de l'image")
            }
            .frame(maxWidth: .infinity)
        }
        .cornerRadius(ResponsiveSizes.imageSize(20, for: sizeCategory, device: device))
        .accessibilityElement()
        .accessibilityLabel("Image du produit : \(product.picture.description)")
        .accessibilityAddTraits(.isImage)
        .clipped()
    }
}

#Preview {
    ProductImage(
        product: .preview,
        sizeCategory: .medium,
        device: UIDevice.current,
        imageSize: 198,
        imageLoaded: .constant(true)
    )
}
