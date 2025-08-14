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
    let imageSize: CGFloat?
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationLink(destination: ProductDetailView(product: product)) {
                AsyncImage(url: URL(string: product.picture.url)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: imageSize != nil ? ResponsiveSizes.imageSize(imageSize!, for: sizeCategory, device: device) : nil,
                            height: imageSize != nil ? ResponsiveSizes.imageSize(imageSize!, for: sizeCategory, device: device) : nil
                        )
                        .frame(maxWidth: .infinity)
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(height: imageSize != nil ? ResponsiveSizes.imageSize(imageSize!, for: sizeCategory, device: device) : nil)
                        .frame(maxWidth: .infinity)
                        .accessibilityLabel("Chargement de l'image")
                }
            }
            .cornerRadius(ResponsiveSizes.imageSize(20, for: sizeCategory, device: device))
            .accessibilityElement()
            .accessibilityLabel("Image du produit : \(product.picture.description)")
            .accessibilityAddTraits(.isImage)
            .contentShape(Rectangle())
            .clipped()
            
            LikeItem(
                likes: currentLikes,
                isLiked: isLiked,
                onToggle: toggleLike
            )
            .padding(ResponsiveSizes.fontSize(8, for: sizeCategory, device: device))
        }
        .accessibilityElement(children: .contain)
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
        device: UIDevice.current,
        imageSize: 198
    )
}
