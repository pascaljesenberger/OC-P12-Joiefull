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
    @Binding var selectedProduct: Product?
    let isDetailView: Bool
    let availableWidth: CGFloat?
    
    init(product: Product, selectedProduct: Binding<Product?> = .constant(nil), isDetailView: Bool = false, availableWidth: CGFloat? = nil) {
        self._viewModel = StateObject(wrappedValue: ProductViewModel(product: product))
        self._selectedProduct = selectedProduct
        self.isDetailView = isDetailView
        self.availableWidth = availableWidth
    }
    
    private var showDescription: Bool { isDetailView }
    private var isNavigationEnabled: Bool { !isDetailView }
    private var showShareButton: Bool { isDetailView }
    
    // Calcule la largeur optimale pour la vue
    private var itemWidth: CGFloat {
        if isDetailView, let width = availableWidth {
            return width
        }
        return deviceEnvironment.productImageSize(isDetailView: isDetailView)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: deviceEnvironment.fontSize(isDetailView ? 16 : 8)) {
            ProductImageWithActions(
                product: viewModel.product,
                currentLikes: viewModel.currentLikes,
                isLiked: viewModel.isLiked,
                toggleLike: viewModel.toggleLike,
                selectedProduct: $selectedProduct,
                isDetailView: isDetailView,
                availableWidth: availableWidth
            )
            
            ProductInfo(
                product: viewModel.product,
                showDescription: showDescription,
                isDetailView: isDetailView,
                selectedProduct: $selectedProduct
            )
            .accessibilityElement(children: .combine)
        }
        .frame(maxWidth: itemWidth)
        .accessibilityElement(children: .contain)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 40) {
            ProductItem(product: .preview, selectedProduct: .constant(nil), isDetailView: true)
                .environmentObject(DeviceEnvironment())
            ProductItem(product: .preview, selectedProduct: .constant(nil))
                .environmentObject(DeviceEnvironment())
        }
        .padding(.horizontal)
    }
}
