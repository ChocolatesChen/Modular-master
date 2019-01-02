//
//  UIImageView+SnapKit.swift
//  Modular-master
//
//  Created by cg on 2018/12/27.
//  Copyright © 2018 df. All rights reserved.
//
import UIKit
import SnapKit

extension UIImageView  {
    
    /// Basic UIImageView
    ///
    /// - Parameters:
    ///   - imageName: imageName
    ///   - superView: superView
    ///   - block: block
    /// - Returns: UIImageView
    class func df_getImageView(withImageName imageName: String?,
                            superView: UIView?,
                            masonrySet block: @escaping (_ view: UIImageView?, _ make: ConstraintMaker?) -> Void) -> UIImageView? {
        
        var imageView: UIImageView?
        if imageName?.count == 0 || (imageName == "") {
            imageView = UIImageView()
        } else {
            if let aName = imageName {
                imageView = UIImageView(image: UIImage(named: aName))
            }
        }
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        if let aView = imageView {
            superView?.addSubview(aView)
        }
        
        imageView?.snp.makeConstraints { (make) in
            block(imageView,make)
        }
        
        return imageView

    }

    
    
}
