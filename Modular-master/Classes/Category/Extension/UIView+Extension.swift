//
//  UIView+Extension.swift
//  Modular-master
//
//  Created by cg on 2018/12/27.
//  Copyright © 2018 df. All rights reserved.
//

import UIKit

// MARK: - 绘制圆角  阴影
extension UIView {
    
    // MARK: - layer
    
    /// 添加圆角
    ///
    /// - Parameter cornerRadius: 半径
    func df_rounded(_ cornerRadius: CGFloat) {
        df_rounded(cornerRadius, width: 0, color: nil)
    }
    
    /// 添加边框
    ///
    /// - Parameters:
    ///   - borderWidth: 宽度
    ///   - borderColor: 边框颜色
    func df_border(_ borderWidth: CGFloat, color borderColor: UIColor?) {
        df_rounded(0, width: borderWidth, color: borderColor)
    }
    
    /// 添加圆角、边框
    ///
    /// - Parameters:
    ///   - cornerRadius: 半径
    ///   - borderWidth: 宽度
    ///   - borderColor: 颜色
    func df_rounded(_ cornerRadius: CGFloat, width borderWidth: CGFloat, color borderColor: UIColor?) {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor?.cgColor
        layer.masksToBounds = true
    }
}
