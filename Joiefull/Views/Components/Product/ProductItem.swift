//
//  ProductItem.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import SwiftUI

struct ProductItem: View {
    @StateObject private var viewModel: ProductViewModel
    @Environment(\.sizeCategory) private var sizeCategory
    private let device = UIDevice.current
    let showDescription: Bool
    let imageSize: CGFloat?
    let isNavigationEnabled: Bool
    let showShareButton: Bool
    let isDetailView: Bool
    
    init(product: Product, showDescription: Bool = false, imageSize: CGFloat? = 198, isNavigationEnabled: Bool = true, showShareButton: Bool = false, isDetailView: Bool = false) {
        self._viewModel = StateObject(wrappedValue: ProductViewModel(product: product))
        
        if isDetailView {
            self.showDescription = true
            self.imageSize = 360
            self.isNavigationEnabled = false
            self.showShareButton = true
            self.isDetailView = true
        } else {
            self.showDescription = showDescription
            self.imageSize = imageSize
            self.isNavigationEnabled = isNavigationEnabled
            self.showShareButton = showShareButton
            self.isDetailView = false
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: ResponsiveSizes.fontSize(isDetailView ? 16 : 8, for: sizeCategory, device: device)) {
            ProductImageWithActions(
                product: viewModel.product,
                currentLikes: viewModel.currentLikes,
                isLiked: viewModel.isLiked,
                toggleLike: viewModel.toggleLike,
                sizeCategory: sizeCategory,
                device: device,
                imageSize: imageSize,
                isDetailView: isDetailView
            )
            
            ProductInfo(product: viewModel.product, showDescription: showDescription, isDetailView: isDetailView)
                .accessibilityElement(children: .combine)
        }
        .frame(maxWidth: imageSize != nil ? ResponsiveSizes.imageSize(imageSize!, for: sizeCategory, device: device) : nil)
        .accessibilityElement(children: .contain)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 40) {
            ProductItem(product: .preview, isDetailView: true)
            ProductItem(product: .preview, showDescription: false, imageSize: 198, isNavigationEnabled: true)
        }
        .padding(.horizontal)
    }
}
