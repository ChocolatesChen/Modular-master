//
//  BaseUICollectionView.swift
//  Modular-master
//
//  Created by cg on 2018/12/27.
//  Copyright © 2018 df. All rights reserved.
//

import UIKit

class BaseUICollectionView: UICollectionView {

    //无论外界调用 init 还是 initwithFrame, 最终都会走initwithFrame方法
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        if #available(iOS 11.0, *) {
            if self.responds(to: #selector(getter: UIScrollView.contentInsetAdjustmentBehavior)){
                self.contentInsetAdjustmentBehavior = .never
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
