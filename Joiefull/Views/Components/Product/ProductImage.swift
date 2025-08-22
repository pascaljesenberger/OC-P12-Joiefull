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
    
    private var imageSize: CGFloat {
        deviceEnvironment.productImageSize(isDetailView: isDetailView)
    }
    
    var body: some View {
        AsyncImage(url: URL(string: product.picture.url)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(
                    maxWidth: deviceEnvironment.imageSize(imageSize),
                    maxHeight: deviceEnvironment.imageSize(imageSize)
                )
                .frame(maxWidth: .infinity)
                .clipped()
                .onAppear { imageLoaded = true }
        } placeholder: {
            ZStack {
                RoundedRectangle(cornerRadius: deviceEnvironment.imageSize(20))
                    .fill(Color.gray.opacity(0.3))
                    .frame(
                        width: deviceEnvironment.imageSize(imageSize),
                        height: deviceEnvironment.imageSize(imageSize)
                    )
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .accessibilityLabel("Chargement de l'image")
            }
            .frame(
                width: deviceEnvironment.imageSize(imageSize),
                height: deviceEnvironment.imageSize(imageSize)
            )
            .frame(maxWidth: .infinity)
        }
        .cornerRadius(deviceEnvironment.imageSize(20))
        .accessibilityElement()
        .accessibilityLabel("Image du produit : \(product.picture.description)")
        .accessibilityAddTraits(.isImage)
        .clipped()
    }
}

#Preview {
    ProductImage(
        product: .preview,
        isDetailView: false,
        imageLoaded: .constant(true)
    )
    .environmentObject(DeviceEnvironment())
}
