//
//  UIFont.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/22.
//

import UIKit
import Foundation

public extension UIFont {

    enum Size {
        /// Style name: h1 - Font size: 96.0
        case h1
        /// Style name: h2 - Font size: 60.0
        case h2
        /// Style name: h3 - Font size: 48.0
        case h3
        /// Style name: h4 - Font size: 34.0
        case h4
        /// Style name: h5 - Font size: 24.0
        case h5
        /// Style name: h6 - Font size: 20.0
        case h6
        /// Style name: avatarLetter - Font size: 20.0
        case avatarLetter
        /// Style name: subtitle1 - Font size: 16.0
        case subtitle1
        /// Style name: body1 - Font size: 16.0
        case body1
        /// Style name: inputText - Font size: 16.0
        case inputText
        /// Style name: subtitle2 - Font size: 14.0
        case subtitle2
        /// Style name: body2 - Font size: 14.0
        case body2
        /// Style name: buttonMedium - Font size: 14.0
        case buttonMedium
        /// Style name: buttonLarge - Font size: 15.0
        case buttonLarge
        /// Style name: buttonSmall - Font size: 13.0
        case buttonSmall
        /// Style name: caption - Font size: 12.0
        case caption
        /// Style name: overline - Font size: 12.0
        case overline
        /// Style name: inputLabel - Font size: 12.0
        case inputLabel
        /// Style name: helperText - Font size: 12.0
        case helperText
        /// Style name: tooltip - Font size: 10.0
        case tooltip
        /// Style name: fieldLabel - Font size: 8.0
        case fieldLabel

        var value : CGFloat {
            switch self {
            case .h1: return 96.0
            case .h2: return 60.0
            case .h3: return 48.0
            case .h4: return 34.0
            case .h5: return 24.0
            case .h6: return 20.0
            case .avatarLetter: return 20.0
            case .subtitle1: return 16.0
            case .body1: return 16.0
            case .inputText: return 16.0
            case .subtitle2: return 14.0
            case .body2: return 14.0
            case .buttonMedium: return 14.0
            case .buttonLarge: return 15.0
            case .buttonSmall: return 13.0
            case .caption: return 12.0
            case .overline: return 12.0
            case .inputLabel: return 12.0
            case .helperText: return 12.0
            case .tooltip: return 10.0
            case .fieldLabel: return 8.0
            }
        }
    }

    enum Roboto: String {
        case black = "Roboto-Black"
        case blackItalic = "Roboto-BlackItalic"
        case bold = "Roboto-Bold"
        case boldItalic = "Roboto-BoldItalic"
        case italic = "Roboto-Italic"
        case light = "Roboto-Light"
        case lightItalic = "Roboto-LightItalic"
        case medium = "Roboto-Medium"
        case mediumItalic = "Roboto-MediumItalic"
        case regular = "Roboto-Regular"
        case thin = "Roboto-Thin"
        case thinItalic = "Roboto-ThinItalic"
    }

    static func roboto(type: UIFont.Roboto, size: Size) -> UIFont {
        return UIFont(name: type.rawValue, size: size.value) ?? UIFont.systemFont(ofSize: size.value)
    }
}
