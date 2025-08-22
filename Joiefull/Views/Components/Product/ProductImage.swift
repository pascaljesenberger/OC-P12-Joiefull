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
    let isDetailView: Bool
    @Binding var imageLoaded: Bool
    
    private var imageSize: CGFloat {
        isDetailView ? 360 : 198
    }
    
    var body: some View {
        AsyncImage(url: URL(string: product.picture.url)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(
                    maxWidth: ResponsiveSizes.imageSize(imageSize, for: sizeCategory, device: device),
                    maxHeight: ResponsiveSizes.imageSize(imageSize, for: sizeCategory, device: device)
                )
                .frame(maxWidth: .infinity)
                .clipped()
                .onAppear { imageLoaded = true }
        } placeholder: {
            ZStack {
                RoundedRectangle(cornerRadius: ResponsiveSizes.imageSize(20, for: sizeCategory, device: device))
                    .fill(Color.gray.opacity(0.3))
                    .frame(
                        width: ResponsiveSizes.imageSize(imageSize, for: sizeCategory, device: device),
                        height: ResponsiveSizes.imageSize(imageSize, for: sizeCategory, device: device)
                    )
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .accessibilityLabel("Chargement de l'image")
            }
            .frame(
                width: ResponsiveSizes.imageSize(imageSize, for: sizeCategory, device: device),
                height: ResponsiveSizes.imageSize(imageSize, for: sizeCategory, device: device)
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
        isDetailView: false,
        imageLoaded: .constant(true)
    )
}
