//
//  HangerAnimation.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 08/08/2025.
//

import SwiftUI

struct HangerAnimation: View {
    @State private var angle: Double = -20
    @EnvironmentObject private var deviceEnvironment: DeviceEnvironment
    
    var body: some View {
        VStack {
            Image("hanger")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: deviceEnvironment.imageSize(140))
                .rotationEffect(.degrees(angle), anchor: .top)
                .animation(
                    Animation.easeInOut(duration: 1)
                        .repeatForever(autoreverses: true),
                    value: angle
                )
                .padding(.bottom, 60)
            
            Text("Chargement des produits en cours...")
                .font(.system(size: deviceEnvironment.fontSize(14)))
                .foregroundColor(.black)
            
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
        .environmentObject(DeviceEnvironment())
}
