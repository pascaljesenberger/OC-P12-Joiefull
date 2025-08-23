//
//  ResponsiveSizes.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 09/08/2025.
//

import SwiftUI

struct ResponsiveSizes {
    static func imageSize(_ base: CGFloat, for sizeCategory: ContentSizeCategory, device: UIDevice) -> CGFloat {
        let multiplier: CGFloat
        switch sizeCategory {
        case .extraSmall: multiplier = 0.8
        case .small: multiplier = 0.9
        case .medium: multiplier = 1.0
        case .large: multiplier = 1.1
        case .extraLarge: multiplier = 1.2
        case .extraExtraLarge: multiplier = 1.3
        case .extraExtraExtraLarge: multiplier = 1.4
        default: multiplier = 1.5
        }
        
        let deviceMultiplier: CGFloat = device.userInterfaceIdiom == .pad ? 1.4 : 1.0
        
        return base * multiplier * deviceMultiplier
    }
    
    static func fontSize(_ base: CGFloat, for sizeCategory: ContentSizeCategory, device: UIDevice) -> CGFloat {
        let multiplier: CGFloat
        switch sizeCategory {
        case .extraSmall: multiplier = 0.8
        case .small: multiplier = 0.9
        case .medium: multiplier = 1.0
        case .large: multiplier = 1.1
        case .extraLarge: multiplier = 1.2
        case .extraExtraLarge: multiplier = 1.3
        case .extraExtraExtraLarge: multiplier = 1.4
        default: multiplier = 1.5
        }
        
        let deviceMultiplier: CGFloat = device.userInterfaceIdiom == .pad ? 1.3 : 1.0
        
        return base * multiplier * deviceMultiplier
    }
}
