//
//  ShareButton.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 14/08/2025.
//

import SwiftUI

struct ShareButton: View {
    let product: Product
    @EnvironmentObject private var deviceEnvironment: DeviceEnvironment
    
    var body: some View {
        ShareLink(item: URL(string: product.picture.url)!) {
            Image("share")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: deviceEnvironment.imageSize(18))
                .padding(10)
                .background(Color.white)
                .clipShape(Circle())
                .contentShape(Circle())
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ShareButton(product: .preview)
            .environmentObject(DeviceEnvironment())
    }
}
