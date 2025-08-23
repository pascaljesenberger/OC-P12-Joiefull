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
    @Binding var selectedProduct: Product?
    @EnvironmentObject private var deviceEnvironment: DeviceEnvironment
    let isDetailView: Bool
    let availableWidth: CGFloat?
    @State private var imageLoaded = false
    
    private var imageSize: CGFloat {
        if isDetailView, let width = availableWidth {
            return width
        }
        return deviceEnvironment.productImageSize(isDetailView: isDetailView)
    }
    
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
                    isDetailView: isDetailView,
                    imageLoaded: $imageLoaded,
                    selectedProduct: $selectedProduct,
                    imageSize: imageSize
                )
            } else {
                ProductImage(
                    product: product,
                    isDetailView: isDetailView,
                    imageLoaded: $imageLoaded,
                    isSelected: false,
                    customImageSize: imageSize
                )
            }
            
            if imageLoaded {
                VStack(alignment: .trailing) {
                    if showShareButton {
                        ShareButton(product: product)
                            .padding(deviceEnvironment.fontSize(8))
                    }
                    
                    Spacer()
                    
                    LikeButton(
                        likes: currentLikes,
                        isLiked: isLiked,
                        onToggle: toggleLike,
                        isDetailView: isDetailView
                    )
                    .padding(deviceEnvironment.fontSize(8))
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
                selectedProduct: .constant(nil),
                isDetailView: true,
                availableWidth: 300
            )
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
    .environmentObject(DeviceEnvironment())
}
