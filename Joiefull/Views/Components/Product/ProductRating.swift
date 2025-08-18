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
    @State private var reviewText = ""
    
    var body: some View {
        VStack(spacing: 24) {
            HStack {
                Image(systemName: "person.crop.circle")
                    .font(.system(size: ResponsiveSizes.fontSize(42, for: sizeCategory, device: device)))
                    .foregroundColor(Color.blue)
                
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: index <= rating ? "star.fill" : "star")
                        .font(.system(size: ResponsiveSizes.fontSize(28, for: sizeCategory, device: device)))
                        .foregroundColor(index <= rating ? Color.appOrange : .black.opacity(0.5))
                        .onTapGesture {
                            rating = index
                        }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Partagez ici votre impression sur cette pièce", text: $reviewText, axis: .vertical)
                .lineLimit(3...10)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 1)
                        .opacity(0.2)
                )
                .submitLabel(.done)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProductRating()
}
