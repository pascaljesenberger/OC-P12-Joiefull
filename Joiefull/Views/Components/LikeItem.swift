//
//  LikeItem.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import SwiftUI

struct LikeItem: View {
    let likes: Int
    let isLiked: Bool
    let onToggle: () -> Void
    @Environment(\.sizeCategory) private var sizeCategory
    private let device = UIDevice.current
    
    @State private var animate = false
    
    var body: some View {
        Button {
            onToggle()
            animate = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                animate = false
            }
        } label: {
            HStack {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .font(.system(size: ResponsiveSizes.fontSize(14, for: sizeCategory, device: device)))
                    .foregroundColor(isLiked ? .red : .primary)
                    .scaleEffect(animate ? 1.4 : 1)
                    .animation(.easeOut(duration: 0.1), value: animate)
                
                Text("\(likes)")
                    .font(.system(size: ResponsiveSizes.fontSize(14, for: sizeCategory, device: device), weight: .semibold))
                    .foregroundColor(isLiked ? .red : .primary)
                    .monospacedDigit()
                    .contentTransition(.numericText(value: Double(likes)))
                    .transaction { t in
                        t.animation = .default
                    }
            }
            .padding(.horizontal, ResponsiveSizes.fontSize(8, for: sizeCategory, device: device))
            .padding(.vertical, ResponsiveSizes.fontSize(6, for: sizeCategory, device: device))
            .background(Color.white)
            .clipShape(Capsule())
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(isLiked ? "Retirer des favoris" : "Ajouter aux favoris")
        .accessibilityValue("\(likes) j'aime")
        .accessibilityHint(isLiked ? "Double-touchez pour retirer ce produit de vos favoris" : "Double-touchez pour ajouter ce produit à vos favoris")
        .accessibilityAddTraits(.isButton)
    }
}

#Preview {
    VStack(spacing: 20) {
        LikeItem(likes: 42, isLiked: false, onToggle: {})
        LikeItem(likes: 43, isLiked: true, onToggle: {})
    }
    .background(Color.black)
}
