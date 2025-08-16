//
//  ProductRating.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 16/08/2025.
//

import SwiftUI

struct ProductRating: View {
    @Environment(\.sizeCategory) private var sizeCategory
    private let device = UIDevice.current
    @State private var rating: Int = 0
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .font(.system(size: ResponsiveSizes.fontSize(42, for: sizeCategory, device: device)))
                .foregroundColor(Color.blue)
            
            ForEach(1...5, id: \.self) { index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .font(.system(size: ResponsiveSizes.fontSize(28, for: sizeCategory, device: device)))
                    .foregroundColor(index <= rating ? Color.appOrange : .black.opacity(0.7))
                    .onTapGesture {
                        rating = index
                    }
            }
        }
    }
}

#Preview {
    ProductRating()
}
