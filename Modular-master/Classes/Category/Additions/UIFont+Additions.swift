//
//  UIFont+Additions.swift
//  Modular-master
//
//  Created by cg on 2018/12/27.
//  Copyright © 2018 df. All rights reserved.
//

import Foundation
import UIKit

/**字体类型*/
enum CustomFontType : Int {
    case Ultralight
    case Thin
    case Light
    case DefaultFont //默认Regular
    case Regular
    case Medium
    case Semibold
}

extension UIFont {
    
    class func df_getCustomFontType(with stringTypeName: CustomFontType, fontSize size: CGFloat) -> UIFont? {
        var stringType = ""
        switch stringTypeName {
        case .Regular:
            if IOS9 {
                stringType = "PingFangSC-Regular"
            } else {
                stringType = "Helvetica"
            }
        case .Medium:
            if IOS9 {
                stringType = "PingFangSC-Medium"
            } else {
                stringType = "Helvetica-Bold"
            }
        case .Semibold:
            if IOS9 {
                stringType = "PingFangSC-Semibold" 
            } else {
                stringType = "Helvetica-Bold"
            }
        case .Ultralight:
            if IOS9 {
                stringType = "PingFangSC-Ultralight"
            } else {
                stringType = "Helvetica-Light"
            }
        case .Thin:
            if IOS9 {
                stringType = "PingFangSC-Thin"
            } else {
                stringType = "Helvetica-Light"
            }
        case .Light:
            if IOS9 {
                stringType = "PingFangSC-Light"
            } else {
                stringType = "Helvetica"
            }
        case .DefaultFont:
            fallthrough
        default:
            break
        }
        
        if (stringType == "") {
            return UIFont.systemFont(ofSize: size)
        } else {
            return UIFont(name: stringType, size: size)
        }
    }

}
