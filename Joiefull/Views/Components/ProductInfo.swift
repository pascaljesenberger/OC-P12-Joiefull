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
    
    var body: some View {
        VStack(alignment: .leading, spacing: ResponsiveSizes.fontSize(4, for: sizeCategory, device: device)) {
            HStack {
            Text(product.name)
                .font(.system(size: ResponsiveSizes.fontSize(14, for: sizeCategory, device: device), weight: .semibold))
                .foregroundColor(.black)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
                Spacer()
                
                Image(systemName: "star.fill")
                    .font(.system(size: ResponsiveSizes.fontSize(14, for: sizeCategory, device: device)))
                    .foregroundColor(.appOrange)
                
                Text(product.rating)
                    .font(.system(size: ResponsiveSizes.fontSize(14, for: sizeCategory, device: device)))
                    .foregroundColor(.black)
                    .monospacedDigit()
            }
            
            HStack {
                Text(String(format: "%.2f €", product.price))
                    .font(.system(size: ResponsiveSizes.fontSize(14, for: sizeCategory, device: device)))
                    .foregroundColor(.black)
                
                Spacer()
                
                if product.original_price > product.price {
                    Text(String(format: "%.2f €", product.original_price))
                        .font(.system(size: ResponsiveSizes.fontSize(14, for: sizeCategory, device: device)))
                        .strikethrough()
                        .foregroundColor(.black.opacity(0.7))
                }
            }
        }
        .padding(.horizontal)
        .frame(minHeight: ResponsiveSizes.imageSize(60, for: sizeCategory, device: device), alignment: .topLeading)
    }
}

#Preview {
    ProductInfo(product: .preview)
}  
