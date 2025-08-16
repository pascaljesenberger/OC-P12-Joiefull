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
    let isDetailView: Bool
    @State private var imageLoaded = false
    
    private var isNavigationEnabled: Bool {
        !isDetailView
    }
    
    private var showShareButton: Bool {
        isDetailView
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if isNavigationEnabled {
                NavigableProductImage(
                    product: product,
                    sizeCategory: sizeCategory,
                    device: device,
                    imageSize: imageSize,
                    imageLoaded: $imageLoaded
                )
            } else {
                ProductImage(
                    product: product,
                    sizeCategory: sizeCategory,
                    device: device,
                    imageSize: imageSize,
                    imageLoaded: $imageLoaded
                )
            }
            
            if imageLoaded {
                VStack(alignment: .trailing) {
                    if showShareButton {
                        ShareButton(product: product)
                            .padding(ResponsiveSizes.fontSize(8, for: sizeCategory, device: device))
                    }
                    
                    Spacer()
                    
                    LikeButton(
                        likes: currentLikes,
                        isLiked: isLiked,
                        onToggle: toggleLike,
                        isDetailView: isDetailView
                    )
                    .padding(ResponsiveSizes.fontSize(8, for: sizeCategory, device: device))
                }
            }
        }
        .accessibilityElement(children: .contain)
        .clipped()
    }
}

#Preview {
    ScrollView {
        VStack {
            ProductImageWithActions(
                product: .preview,
                currentLikes: 12,
                isLiked: false,
                toggleLike: {},
                sizeCategory: .small,
                device: UIDevice.current,
                imageSize: 360,
                isDetailView: true
            )
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}
