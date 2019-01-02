//
//  DFHorizontalPageLayout.swift
//  Modular-master
//
//  Created by cg on 2018/12/27.
//  Copyright © 2018 df. All rights reserved.
//

import UIKit

class DFHorizontalPageLayout: UICollectionViewFlowLayout {
    private var itemWidth: CGFloat {
        get {
            return CGFloat(kScreenWidth / 5) //item 宽度
        }
    }
    private var itemHeight: CGFloat {
        get {
            return CGFloat(self.itemWidth * 1.17) //item 高度
        }
    }
    /** 一行中cell的个数*/
    public var itemCountPerRow: Int!
    /** 一页显示多少行*/
    public var rowCount: Int!
    /** 存储collectionView上cell的属性*/
    fileprivate var allAttributes: [UICollectionViewLayoutAttributes] = []
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepare() {
        super.prepare()
        let count = self.collectionView?.numberOfItems(inSection: 0) ?? 0
        for i in 0..<count {
            let indexPath = IndexPath(item: i, section: 0)
            let attributes = self.layoutAttributesForItem(at: indexPath)
            if let attr = attributes{
                self.allAttributes.append(attr)
            }
        }
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        var item = indexPath.item
        
        var x = 0
        var y = 0
        self.targetPosition(item: item, x: &x, y: &y)
        item = originItem(x, y: y)
        let newIndexPath = IndexPath(item: item, section: 0)
        let theNewAttr = super.layoutAttributesForItem(at: newIndexPath)
        theNewAttr?.indexPath = indexPath
        return theNewAttr
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        var tmp: [UICollectionViewLayoutAttributes] = []
        if let attrs = attributes{
            for attr in attrs {
                for attr2 in self.allAttributes {
                    if attr.indexPath.item == attr2.indexPath.item {
                        tmp.append(attr2)
                        break
                    }
                }
            }
        }
        return tmp
    }
    //根据item计算出目标item的偏移量
    //x 横向偏移 y 竖向偏移
    fileprivate func targetPosition(item: Int, x: inout Int, y: inout Int) {
        let page = item / (self.itemCountPerRow * self.rowCount)
        
        x = item % self.itemCountPerRow + page * self.itemCountPerRow
        y = item / self.itemCountPerRow - page * self.rowCount
        
    }
    //根据偏移量计算item
    fileprivate func originItem(_ x: Int, y: Int) -> Int {
        let item = x * self.rowCount + y
        return item
    }
}
