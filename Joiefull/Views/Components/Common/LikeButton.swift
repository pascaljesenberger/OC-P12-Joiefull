//
//  LikeButton.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import SwiftUI

struct LikeButton: View {
    let likes: Int
    let isLiked: Bool
    let onToggle: () -> Void
    let isDetailView: Bool
    @Environment(\.sizeCategory) private var sizeCategory
    private let device = UIDevice.current
    @State private var animate = false
    
    var body: some View {
        let imageSize: CGFloat = isDetailView ? 18 : 14
        let fontSize: CGFloat = isDetailView ? 18 : 14
        
        Button {
            onToggle()
            animate = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                animate = false
            }
        } label: {
            HStack {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .font(.system(size: ResponsiveSizes.fontSize(imageSize, for: sizeCategory, device: device)))
                    .foregroundColor(isLiked ? .red : .primary)
                    .scaleEffect(animate ? 1.4 : 1)
                    .animation(.easeOut(duration: 0.1), value: animate)
                
                Text("\(likes)")
                    .font(.system(size: ResponsiveSizes.fontSize(fontSize, for: sizeCategory, device: device), weight: .semibold))
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
        .accessibilityLabel(accessibilityDescription)
        .accessibilityHint("Touchez deux fois pour ajouter aux favoris")
        .accessibilityAddTraits(.isButton)
        .accessibilityAddTraits(isLiked ? .isSelected : [])
    }
    
    private var accessibilityDescription: String {
        let action = isLiked ? "Retirer des favoris" : "Ajouter aux favoris"
        let likesText = likes == 0 ? "Aucun j'aime" : likes == 1 ? "1 j'aime" : "\(likes) j'aime"
        return "\(action), \(likesText)"
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack(spacing: 20) {
            LikeButton(likes: 42, isLiked: false, onToggle: {}, isDetailView: true)
            LikeButton(likes: 43, isLiked: true, onToggle: {}, isDetailView: false)
        }
    }
}
