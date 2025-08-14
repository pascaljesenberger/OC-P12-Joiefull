//
//  ProductImageLike.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 14/08/2025.
//

import SwiftUI

struct ProductImageLike: View {
    let product: Product
    let currentLikes: Int
    let isLiked: Bool
    let toggleLike: () -> Void
    let sizeCategory: ContentSizeCategory
    let device: UIDevice
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationLink(destination: ProductDetailView(product: product)) {
                AsyncImage(url: URL(string: product.picture.url)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: ResponsiveSizes.imageSize(198, for: sizeCategory, device: device),
                               height: ResponsiveSizes.imageSize(198, for: sizeCategory, device: device))
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .accessibilityLabel("Chargement de l'image")
                }
            }
            .cornerRadius(ResponsiveSizes.imageSize(20, for: sizeCategory, device: device))
            .accessibilityElement()
            .accessibilityLabel("Image du produit : \(product.picture.description)")
            .accessibilityAddTraits(.isImage)
            .contentShape(Rectangle())
            .frame(width: ResponsiveSizes.imageSize(198, for: sizeCategory, device: device),
                   height: ResponsiveSizes.imageSize(198, for: sizeCategory, device: device))
            .clipped()
            
            LikeItem(
                likes: currentLikes,
                isLiked: isLiked,
                onToggle: toggleLike
            )
            .padding(ResponsiveSizes.fontSize(8, for: sizeCategory, device: device))
        }
        .accessibilityElement(children: .contain)
        .frame(width: ResponsiveSizes.imageSize(198, for: sizeCategory, device: device),
               height: ResponsiveSizes.imageSize(198, for: sizeCategory, device: device))
        .clipped()
    }
}

#Preview {
    ProductImageLike(
        product: .preview,
        currentLikes: 12,
        isLiked: false,
        toggleLike: {},
        sizeCategory: .medium,
        device: UIDevice.current
    )
}
