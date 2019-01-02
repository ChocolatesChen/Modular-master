//
//  UILabel+SnapKit.swift
//  Modular-master
//
//  Created by cg on 2018/12/27.
//  Copyright © 2018 df. All rights reserved.
//

import UIKit
import SnapKit

extension UILabel {
    
    /// 创建label
    ///
    /// - Parameters:
    ///   - size: 字体大小
    ///   - fontType: 字体类型枚举
    ///   - textColor: 字体颜色-id
    ///   - superView: superView
    ///   - block: block
    /// - Returns: label实例
    class func df_getLabel(withFontSize size: CGFloat,
                           fontStyle fontType: CustomFontType,
                           textColor: Any? = nil,
                           superView: UIView?,
                           masonrySet block: @escaping (_ view: UILabel?, _ make: ConstraintMaker?) -> Void) -> UILabel? {
        let label = UILabel()
        label.font = UIFont.df_getCustomFontType(with: fontType, fontSize: size)
        if (textColor is String) {
            if let aColor = textColor as? String {
                label.textColor = UIColor.colorWithHex(hexColor: aColor)
            }
            
        } else if (textColor is UIColor) {
            if let aColor = textColor as? UIColor {
                label.textColor = aColor
            }
        }
        
        label.translatesAutoresizingMaskIntoConstraints = false
        superView?.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            block(label,make)
        }
        return label
    }

    class func getLabelWith(_ font: UIFont?,
                            textColor color: Any?,
                            superView: UIView?,
                            masonrySet block: @escaping (_ view: UILabel?, _ make: ConstraintMaker?) -> Void) -> UILabel? {
        let label = UILabel()
        if let aFont = font {
            label.font = aFont
        }
        if (color is String) {
            if let aColor = color as? String {
                label.textColor = UIColor.colorWithHex(hexColor: aColor)
            }
        } else if (color is UIColor) {
            if let aColor = color as? UIColor {
                label.textColor = aColor
            }
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        superView?.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            block(label,make)
        }
        return label
    }

}

