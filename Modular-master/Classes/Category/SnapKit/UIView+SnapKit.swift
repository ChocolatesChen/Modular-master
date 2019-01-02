//
//  UIView+SnapKit.swift
//  Modular-master
//
//  Created by cg on 2018/12/27.
//  Copyright © 2018 df. All rights reserved.
//

import UIKit
import SnapKit

extension UIView  {
    
    /// Basic UIView
    ///
    /// - Parameters:
    ///   - color: backgroundColor
    ///   - superView: superView
    ///   - block: block
    /// - Returns: UIView
    class func df_getViewWith(_ color: UIColor?,
                              superView: UIView?,
                              masonrySet block: @escaping (_ view: UIView?, _ make: ConstraintMaker?) -> Void) -> UIView? {
        
        
        let view = UIView()
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        superView?.addSubview(view)
        
        view.snp.makeConstraints { (make) in
            block(view,make)
        }
        return view

    }

    
}
