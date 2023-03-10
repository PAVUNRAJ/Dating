//
//  CustomFont.swift
//  DatingApp
//
//  Created by PavunRaj on 09/03/23.
//

import Foundation
import UIKit

class CustomFont: UIFont {
    static func CustomFontInterBold(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Inter-Bold", size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
    static func CustomFontInterRegular(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Inter-Regular", size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
    static func CustomFontGilroyRegular(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Gilroy-Regular", size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
    
    static func CustomFontGilroySemiBold(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Gilroy-SemiBold", size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
}
