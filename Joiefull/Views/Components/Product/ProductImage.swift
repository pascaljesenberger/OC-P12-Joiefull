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
    let isDetailView: Bool
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
                let placeholderSize: CGFloat = isDetailView ? 360 : 198
                RoundedRectangle(cornerRadius: ResponsiveSizes.imageSize(20, for: sizeCategory, device: device))
                    .fill(Color.gray.opacity(0.3))
                    .frame(
                        width: ResponsiveSizes.imageSize(placeholderSize, for: sizeCategory, device: device),
                        height: ResponsiveSizes.imageSize(placeholderSize, for: sizeCategory, device: device)
                    )
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .accessibilityLabel("Chargement de l'image")
            }
            .frame(
                width: ResponsiveSizes.imageSize(isDetailView ? 360 : 198, for: sizeCategory, device: device),
                height: ResponsiveSizes.imageSize(isDetailView ? 360 : 198, for: sizeCategory, device: device)
            )
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
        isDetailView: false,
        imageLoaded: .constant(true)
    )
}
