//
//  UIScrollView+SnapKit.swift
//  Modular-master
//
//  Created by cg on 2018/12/27.
//  Copyright © 2018 df. All rights reserved.
//

import UIKit
import SnapKit

extension UIScrollView {
    
    /// Basic UIScrollView
    ///
    /// - Parameters:
    ///   - color: color
    ///   - superView: superView
    ///   - block: block
    /// - Returns: UIScrollView
    class func df_getScrollView(withColorHex color: Any?,
                             superView: UIView?,
                             masonrySet block: @escaping (_ view: UIScrollView?, _ make: ConstraintMaker?) -> Void) -> UIScrollView? {
        
        
        let view = UIScrollView()
        
        if (color is String) {
            if let aColor = color as? String {
                view.backgroundColor = UIColor.colorWithHex(hexColor: aColor)
            }
        } else if (color is UIColor) {
            if let aColor = color as? UIColor {
                view.backgroundColor = aColor
            }
        }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        superView?.addSubview(view)
        
        view.snp.makeConstraints { (make) in
            block(view,make)
        }
        return view
    }

    
}
