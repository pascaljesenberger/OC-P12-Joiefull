//
//  RatingStarsView.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 18/08/2025.
//

import SwiftUI

struct RatingStarsView: View {
    @Binding var rating: Int
    var sizeCategory: ContentSizeCategory
    var device: UIDevice

    var body: some View {
        HStack(spacing: 12) {
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
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    @Previewable @State var rating = 3
    RatingStarsView(rating: $rating, sizeCategory: .small, device: UIDevice.current)
}
