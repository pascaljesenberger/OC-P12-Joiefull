//
//  ProductInfo.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import SwiftUI

struct ProductInfo: View {
    let product: Product
    @Environment(\.sizeCategory) private var sizeCategory
    private let device = UIDevice.current
    let showDescription: Bool
    let isDetailView: Bool
    
    var body: some View {
        let fontSize: CGFloat = isDetailView ? 18 : 14
        
        VStack(alignment: .leading, spacing: ResponsiveSizes.fontSize(8, for: sizeCategory, device: device)) {
            HStack {
                Text(product.name)
                    .font(.system(size: ResponsiveSizes.fontSize(fontSize, for: sizeCategory, device: device), weight: .semibold))
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                        .font(.system(size: ResponsiveSizes.fontSize(fontSize, for: sizeCategory, device: device)))
                        .foregroundColor(.appOrange)
                        .accessibilityHidden(true)
                    
                    Text(product.rating)
                        .font(.system(size: ResponsiveSizes.fontSize(fontSize, for: sizeCategory, device: device)))
                        .foregroundColor(.black)
                        .monospacedDigit()
                }
            }
            
            HStack {
                Text(String(format: "%.2f €", product.price))
                    .font(.system(size: ResponsiveSizes.fontSize(fontSize, for: sizeCategory, device: device)))
                    .foregroundColor(.black)
                
                Spacer()
                
                if product.original_price > product.price {
                    Text(String(format: "%.2f €", product.original_price))
                        .font(.system(size: ResponsiveSizes.fontSize(fontSize, for: sizeCategory, device: device)))
                        .strikethrough()
                        .foregroundColor(.black.opacity(0.7))
                }
            }
            
            if showDescription {
                Text(product.picture.description)
                    .font(.system(size: ResponsiveSizes.fontSize(fontSize, for: sizeCategory, device: device)))
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal)
        .frame(minHeight: ResponsiveSizes.imageSize(60, for: sizeCategory, device: device), alignment: .topLeading)
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
    ProductInfo(product: .preview, showDescription: true, isDetailView: false)
}
