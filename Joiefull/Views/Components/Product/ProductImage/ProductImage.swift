//
//  ProductImage.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 14/08/2025.
//

import SwiftUI

struct ProductImage: View {
    let product: Product
    @EnvironmentObject private var deviceEnvironment: DeviceEnvironment
    let isDetailView: Bool
    @Binding var imageLoaded: Bool
    let isSelected: Bool
    let customImageSize: CGFloat?
    
    init(product: Product, isDetailView: Bool, imageLoaded: Binding<Bool>, isSelected: Bool = false, customImageSize: CGFloat? = nil) {
        self.product = product
        self.isDetailView = isDetailView
        self._imageLoaded = imageLoaded
        self.isSelected = isSelected
        self.customImageSize = customImageSize
    }
    
    private var imageSize: CGFloat {
        let size: CGFloat
        if let customSize = customImageSize {
            size = customSize
        } else if isDetailView && deviceEnvironment.isIpad {
            size = deviceEnvironment.productImageSize(isDetailView: isDetailView) * 0.8
        } else {
            size = deviceEnvironment.productImageSize(isDetailView: isDetailView)
        }
        if !size.isFinite || size <= 0 {
            return 100
        }
        return size
    }
    
    var body: some View {
        AsyncImage(url: URL(string: product.picture.url)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: imageSize, height: imageSize)
                .clipped()
                .onAppear { imageLoaded = true }
        } placeholder: {
            ZStack {
                RoundedRectangle(cornerRadius: deviceEnvironment.imageSize(20))
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: imageSize, height: imageSize)
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .accessibilityLabel("Chargement de l'image")
            }
            .frame(width: imageSize, height: imageSize)
            .frame(maxWidth: .infinity)
        }
        .cornerRadius(deviceEnvironment.imageSize(20))
        .overlay(
            RoundedRectangle(cornerRadius: deviceEnvironment.imageSize(20))
                .strokeBorder(Color.appLightBlue, lineWidth: isSelected ? 3 : 0)
        )
        .accessibilityElement()
        .accessibilityLabel("Image du produit : \(product.picture.description)")
        .accessibilityAddTraits(.isImage)
        .clipped()
        .contentShape(Rectangle())
    }
}

#Preview {
    VStack {
        ProductImage(
            product: .preview,
            isDetailView: false,
            imageLoaded: .constant(true),
            isSelected: true
        )
        ProductImage(
            product: .preview,
            isDetailView: false,
            imageLoaded: .constant(true),
            isSelected: false
        )
    }
    .environmentObject(DeviceEnvironment())
}
