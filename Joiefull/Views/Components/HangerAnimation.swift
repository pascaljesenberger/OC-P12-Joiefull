//
//  HangerAnimation.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 08/08/2025.
//

import SwiftUI

struct HangerAnimation: View {
    @State private var angle: Double = -20
    @Environment(\.sizeCategory) private var sizeCategory
    private let device = UIDevice.current
    
    var body: some View {
        VStack {
            Image("hanger")
                .resizable()
                .scaledToFit()
                .frame(width: ResponsiveSizes.imageSize(140, for: sizeCategory, device: device))
                .rotationEffect(.degrees(angle), anchor: .top)
                .animation(
                    Animation.easeInOut(duration: 1)
                        .repeatForever(autoreverses: true),
                    value: angle
                )
                .onAppear {
                    angle = 20
                }
                .accessibilityLabel("Cintre qui se balance")
                .accessibilityHint("Animation de chargement")
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Chargement des produits en cours")
    }
}

#Preview {
    HangerAnimation()
}
