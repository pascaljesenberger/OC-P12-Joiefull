//
//  ReviewTextView.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 18/08/2025.
//

import SwiftUI

struct ReviewTextView: View {
    @Binding var reviewText: String

    var body: some View {
        TextField("Partagez ici votre impression sur cette pièce", text: $reviewText, axis: .vertical)
            .lineLimit(3...10)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black.opacity(0.2), lineWidth: 1)
            )
            .submitLabel(.done)
    }
}

#Preview {
    @Previewable @State var reviewText = "Ceci est mon avis"
    ReviewTextView(reviewText: $reviewText)
        .frame(height: 100)
        .padding()
}
