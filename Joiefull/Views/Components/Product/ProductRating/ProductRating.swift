//
//  ProductRating.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 16/08/2025.
//

import SwiftUI

struct ProductRating: View {
    @State private var rating: Int = 0
    @State private var reviewText = ""

    var body: some View {
        VStack(spacing: 14) {
            RatingStars(rating: $rating)
            ReviewText(reviewText: $reviewText)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProductRating()
        .environmentObject(DeviceEnvironment())
}
