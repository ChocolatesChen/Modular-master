//
//  UIStackView+SnapKit.swift
//  Modular-master
//
//  Created by cg on 2018/12/27.
//  Copyright © 2018 df. All rights reserved.
//

import UIKit
import SnapKit

extension UIStackView {

    class func getBasicStackView(backGroundColor color: Any?,
                                         superView: UIView?,
                                         spacing: CGFloat? = nil,
                                         masonrySet block: @escaping (_ view: UIStackView?, _ make: ConstraintMaker?) -> Void) -> UIStackView? {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = spacing ?? 0
        if (color is String) {
            if let aColor = color as? String {
                stackView.backgroundColor = UIColor.colorWithHex(hexColor: aColor)
            }
        } else if (color is UIColor) {
            if let aColor = color as? UIColor {
                stackView.backgroundColor = aColor
            }
        }
        
        superView?.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            block(stackView,make)
        }
        
        return stackView
    }
    
}
