//
//  ProductDetailView.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 12/08/2025.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @EnvironmentObject private var deviceEnvironment: DeviceEnvironment
    @StateObject private var viewModel: ProductViewModel
    
    init(product: Product, selectedProduct: Binding<Product?> = .constant(nil)) {
        self.product = product
        _viewModel = StateObject(wrappedValue: ProductViewModel(product: product))
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 28) {
                    ProductItem(
                        product: product,
                        isDetailView: true,
                        availableWidth: geometry.size.width - 32 // padding horizontal
                    )
                    .frame(maxWidth: .infinity)
                    
                    ProductRating()
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ProductDetailView(product: .preview)
        .environmentObject(DeviceEnvironment())
}
