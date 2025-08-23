//
//  ProductInfo.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import SwiftUI

struct ProductInfo: View {
    let product: Product
    @EnvironmentObject private var deviceEnvironment: DeviceEnvironment
    let showDescription: Bool
    let isDetailView: Bool
    @Binding var selectedProduct: Product?
    
    var body: some View {
        let fontSize: CGFloat = isDetailView ?
        (deviceEnvironment.isIpad ? 16 : 18) : 14
        let isSelected = selectedProduct?.id == product.id
        
        VStack(alignment: .leading, spacing: deviceEnvironment.fontSize(8)) {
            HStack {
                Text(product.name)
                    .font(.system(size: deviceEnvironment.fontSize(fontSize), weight: .semibold))
                    .foregroundColor(isSelected ? .appLightBlue : .black)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                        .font(.system(size: deviceEnvironment.fontSize(fontSize)))
                        .foregroundColor(.appOrange)
                        .accessibilityHidden(true)
                    
                    Text(product.rating)
                        .font(.system(size: deviceEnvironment.fontSize(fontSize)))
                        .foregroundColor(isSelected ? .appLightBlue : .black)
                        .monospacedDigit()
                }
            }
            
            HStack {
                Text(String(format: "%.2f €", product.price))
                    .font(.system(size: deviceEnvironment.fontSize(fontSize)))
                    .foregroundColor(isSelected ? .appLightBlue : .black)
                
                Spacer()
                
                if product.original_price > product.price {
                    Text(String(format: "%.2f €", product.original_price))
                        .font(.system(size: deviceEnvironment.fontSize(fontSize)))
                        .strikethrough()
                        .foregroundColor(isSelected ? .appLightBlue : .black.opacity(0.7))
                }
            }
            
            if showDescription {
                Text(product.picture.description)
                    .font(.system(size: deviceEnvironment.fontSize(14)))
                    .foregroundColor(.black)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.horizontal)
        .frame(minHeight: deviceEnvironment.imageSize(60), alignment: .topLeading)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(accessibilityDescription)
        .accessibilityAddTraits(.isStaticText)
    }
    
    private var accessibilityDescription: String {
        let priceDescription = product.original_price > product.price
        ? "Prix \(String(format: "%.2f", product.price)) euros, prix barré \(String(format: "%.2f", product.original_price)) euros"
        : "Prix \(String(format: "%.2f", product.price)) euros"
        
        return "\(product.name), note \(product.rating) sur 5 étoiles, \(priceDescription)"
    }
}

#Preview {
    ProductInfo(
        product: .preview,
        showDescription: true,
        isDetailView: false,
        selectedProduct: .constant(nil)
    )
    .environmentObject(DeviceEnvironment())
}
