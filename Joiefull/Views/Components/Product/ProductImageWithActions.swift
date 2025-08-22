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
    @EnvironmentObject private var deviceEnvironment: DeviceEnvironment
    let isDetailView: Bool
    @State private var imageLoaded = false
    
    private var imageSize: CGFloat {
        isDetailView ? 360 : 198
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
                    imageLoaded: $imageLoaded
                )
            } else {
                ProductImage(
                    product: product,
                    isDetailView: isDetailView,
                    imageLoaded: $imageLoaded
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
                isDetailView: true
            )
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
    .environmentObject(DeviceEnvironment())
}
