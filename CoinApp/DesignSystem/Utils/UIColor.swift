//
//  UIColor.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(red: (rgb >> 16) & 0xFF,
                  green: (rgb >> 8) & 0xFF,
                  blue: rgb & 0xFF)
    }
    
    fileprivate static func supportedColor(lightHex: Int, darkHex: Int, named: String) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                if UITraitCollection.userInterfaceStyle == .dark {
                    // Return the color for Dark Mode
                    return getColor(hex: darkHex, named: named)
                } else {
                    // Return the color for Light Mode
                    return getColor(hex: lightHex, named: named)
                }
            }
        } else {
            return getColor(hex: lightHex, named: named)
        }
    }

    fileprivate static func getColor(hex: Int, named: String) -> UIColor {
        if #available(iOS 11.0, *) {
            guard let color =  UIColor(named: named) else {
                return UIColor(rgb: hex)
            }
            return color
        } else {
            return UIColor(rgb: hex)
        }
    }

    static func rgba(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    static var main: UIColor {
        return supportedColor(lightHex: 0x6A5DFA, darkHex: 0x6A5DFA, named: "main")
    }

    static var dark: UIColor {
        return supportedColor(lightHex: 0xA02500, darkHex: 0xA02500, named: "dark")
    }
    
    static var error: UIColor {
        return supportedColor(lightHex: 0x9847F5, darkHex: 0x9847F5, named: "error")
    }

    class func backgroundProgressBar() -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { trait -> UIColor in
                if trait.userInterfaceStyle == .dark {
                    return rgba(211, 49, 0, 0.4)
                } else {
                    return rgba(211, 49, 0, 0.4)
                }
            }
        } else {
            return rgba(211, 49, 0, 0.4)
        }
    }

    class func disabledBackgroundButton() -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { trait -> UIColor in
                if trait.userInterfaceStyle == .dark {
                    return rgba(0, 0, 0, 0.12)
                } else {
                    return rgba(0, 0, 0, 0.12)
                }
            }
        } else {
            return rgba(0, 0, 0, 0.12)
        }
    }

    class func disabledTitleButton() -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { trait -> UIColor in
                if trait.userInterfaceStyle == .dark {
                    return rgba(0, 0, 0, 0.26)
                } else {
                    return rgba(0, 0, 0, 0.26)
                }
            }
        } else {
            return rgba(0, 0, 0, 0.26)
        }
    }

    class func eyeGray() -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { trait -> UIColor in
                if trait.userInterfaceStyle == .dark {
                    return rgba(0, 0, 0, 0.54)
                } else {
                    return rgba(0, 0, 0, 0.54)
                }
            }
        } else {
            return rgba(0, 0, 0, 0.54)
        }
    }

    class func titleLabel() -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { trait -> UIColor in
                if trait.userInterfaceStyle == .dark {
                    return rgba(0, 0, 0, 0.87)
                } else {
                    return rgba(0, 0, 0, 0.87)
                }
            }
        } else {
            return rgba(0, 0, 0, 0.87)
        }
    }

    class func subtileLabel() -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { trait -> UIColor in
                if trait.userInterfaceStyle == .dark {
                    return rgba(0, 0, 0, 0.6)
                } else {
                    return rgba(0, 0, 0, 0.6)
                }
            }
        } else {
            return rgba(0, 0, 0, 0.6)
        }
    }
    
    class func bodyOneLabel() -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { trait -> UIColor in
                if trait.userInterfaceStyle == .dark {
                    return rgba(0, 0, 0, 0.38)
                } else {
                    return rgba(0, 0, 0, 0.38)
                }
            }
        } else {
            return rgba(0, 0, 0, 0.38)
        }
    }

    class func contrast() -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { trait -> UIColor in
                if trait.userInterfaceStyle == .dark {
                    return rgba(0, 0, 0, 0.23)
                } else {
                    return rgba(0, 0, 0, 0.23)
                }
            }
        } else {
            return rgba(0, 0, 0, 0.23)
        }
    }

    class func four_p() -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { trait -> UIColor in
                if trait.userInterfaceStyle == .dark {
                    return rgba(211, 49, 0, 0.04)
                } else {
                    return rgba(211, 49, 0, 0.04)
                }
            }
        } else {
            return rgba(211, 49, 0, 0.04)
        }
    }

    class func eight_p() -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { trait -> UIColor in
                if trait.userInterfaceStyle == .dark {
                    return rgba(211, 49, 0, 0.08)
                } else {
                    return rgba(211, 49, 0, 0.08)
                }
            }
        } else {
            return rgba(211, 49, 0, 0.08)
        }
    }

    class func twelve_p() -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { trait -> UIColor in
                if trait.userInterfaceStyle == .dark {
                    return rgba(211, 49, 0, 0.12)
                } else {
                    return rgba(211, 49, 0, 0.12)
                }
            }
        } else {
            return rgba(211, 49, 0, 0.12)
        }
    }

    class func thirty_p() -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { trait -> UIColor in
                if trait.userInterfaceStyle == .dark {
                    return rgba(211, 47, 47, 0.3)
                } else {
                    return rgba(211, 47, 47, 0.3)
                }
            }
        } else {
            return rgba(211, 47, 47, 0.3)
        }
    }
    
    class func background_info() -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { trait -> UIColor in
                if trait.userInterfaceStyle == .dark {
                    return rgba(49, 91, 244, 0.04)
                } else {
                    return rgba(49, 91, 244, 0.04)
                }
            }
        } else {
            return rgba(49, 91, 244, 0.04)
        }
    }
}
