//
//  AppFonts.swift
//  Aldoir
//
//  Created by Kushkumar Katira on 15/09/23.
//

import Foundation
import SwiftUI

class AppFonts {
    
    public static func font(size: CGFloat, style: Poppins) -> Font {
        return Font(UIFont(name: style.name(), size: size) ?? .systemFont(ofSize: 14))
    }
}

enum Poppins {
    
    case black
    case bold
    case extraBold
    case extraLight
    case light
    case medium
    case regular
    case semiBold
    case thin
    
    func name() -> String {
        switch self {
        case .black: return "Poppins-Black"
        case .bold: return "Poppins-Bold"
        case .extraBold: return "Poppins-ExtraBold"
        case .extraLight: return "Poppins-ExtraLight"
        case .light: return "Poppins-Light"
        case .medium: return "Poppins-Medium"
        case .regular: return "Poppins-Regular"
        case .semiBold: return "Poppins-SemiBold"
        case .thin: return "Poppins-Thin"
        }
    }
}
