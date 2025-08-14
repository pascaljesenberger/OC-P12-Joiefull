//
//  ProductImageWithActions.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 14/08/2025.
//

import SwiftUI

struct ProductImageWithActions: View {
    let product: Product
    let currentLikes: Int
    let isLiked: Bool
    let toggleLike: () -> Void
    let sizeCategory: ContentSizeCategory
    let device: UIDevice
    let imageSize: CGFloat?
    let isNavigationEnabled: Bool
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if isNavigationEnabled {
                NavigableProductImage(
                    product: product,
                    sizeCategory: sizeCategory,
                    device: device,
                    imageSize: imageSize
                )
            } else {
                ProductImage(
                    product: product,
                    sizeCategory: sizeCategory,
                    device: device,
                    imageSize: imageSize
                )
            }
            
            VStack {
                ShareButton(product: product)
                    .padding(ResponsiveSizes.fontSize(8, for: sizeCategory, device: device))
                
                Spacer()
                
                LikeButton(
                    likes: currentLikes,
                    isLiked: isLiked,
                    onToggle: toggleLike
                )
                .padding(ResponsiveSizes.fontSize(8, for: sizeCategory, device: device))
            }
        }
        .accessibilityElement(children: .contain)
        .clipped()
    }
}

#Preview {
    VStack(spacing: 20) {
        ProductImageWithActions(
            product: .preview,
            currentLikes: 12,
            isLiked: false,
            toggleLike: {},
            sizeCategory: .medium,
            device: UIDevice.current,
            imageSize: 198,
            isNavigationEnabled: true
        )
        
        ProductImageWithActions(
            product: .preview,
            currentLikes: 8,
            isLiked: true,
            toggleLike: {},
            sizeCategory: .medium,
            device: UIDevice.current,
            imageSize: 198,
            isNavigationEnabled: false
        )
    }
}
