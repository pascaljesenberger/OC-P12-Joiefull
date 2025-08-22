//
//  ProductItem.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import SwiftUI

struct ProductItem: View {
    @StateObject private var viewModel: ProductViewModel
    @EnvironmentObject private var deviceEnvironment: DeviceEnvironment
    let showDescription: Bool
    let imageSize: CGFloat
    let isNavigationEnabled: Bool
    let showShareButton: Bool
    let isDetailView: Bool
    
    init(product: Product, showDescription: Bool = false, imageSize: CGFloat? = nil, isNavigationEnabled: Bool = true, showShareButton: Bool = false, isDetailView: Bool = false) {
        self._viewModel = StateObject(wrappedValue: ProductViewModel(product: product))
        
        if isDetailView {
            self.showDescription = true
            self.imageSize = 360
            self.isNavigationEnabled = false
            self.showShareButton = true
            self.isDetailView = true
        } else {
            self.showDescription = showDescription
            self.imageSize = imageSize ?? 198
            self.isNavigationEnabled = isNavigationEnabled
            self.showShareButton = showShareButton
            self.isDetailView = false
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: deviceEnvironment.fontSize(isDetailView ? 16 : 8)) {
            ProductImageWithActions(
                product: viewModel.product,
                currentLikes: viewModel.currentLikes,
                isLiked: viewModel.isLiked,
                toggleLike: viewModel.toggleLike,
                isDetailView: isDetailView
            )
            
            ProductInfo(product: viewModel.product, showDescription: showDescription, isDetailView: isDetailView)
                .accessibilityElement(children: .combine)
        }
        .frame(maxWidth: deviceEnvironment.imageSize(imageSize))
        .accessibilityElement(children: .contain)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 40) {
            ProductItem(product: .preview, isDetailView: true)
                .environmentObject(DeviceEnvironment())
            ProductItem(product: .preview, showDescription: false, imageSize: 198, isNavigationEnabled: true)
                .environmentObject(DeviceEnvironment())
        }
        .padding(.horizontal)
    }
}
