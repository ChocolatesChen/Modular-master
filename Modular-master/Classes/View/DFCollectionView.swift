//
//  DFCollectionView.swift
//  Modular-master
//
//  Created by cg on 2018/12/27.
//  Copyright © 2018 df. All rights reserved.
//

import UIKit

protocol DFCollectionViewDelegate {
    func collectionView(_ view: DFCollectionView, didSelectItemAt indexPath: IndexPath)
}
class DFCollectionView: UIView {

    enum LineMenu:Int {
        case SingleLine = 1
        case MultiLine = 2
    }
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
    
    private let PageViewWidth:CGFloat     = 60
    
    private lazy var mainCollectionView = getMainCollectionView()
    private var pageView : UIView!
    private var rollLine : UIView!
    
    private var saveModle = [ModularModel]()
    private var rowNumber: LineMenu!
    
    var delegate:DFCollectionViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    convenience init(rowType:LineMenu,model:[ModularModel]) {
        self.init(frame: .zero)
        self.rowNumber = rowType
        self.saveModle = model
        createUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func createUI() {
        self.backgroundColor = UIColor.clear
        self.addContentView()
        
    }
    private func addContentView() {
        func getUnitWidth(type:LineMenu,count:Int,width:CGFloat) ->CGFloat {
            let page = (CGFloat(count) / CGFloat(type == .SingleLine ? 5 : 9))
            let rollWidth = CGFloat(width) / page
            return rollWidth
        }
        
        self.addSubview(self.mainCollectionView)
        mainCollectionView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(self.rowNumber == .SingleLine ? itemHeight + 7 : itemHeight * 2 + 7)
        }
        
        let pageV = UIView()
        pageV.layer.cornerRadius = 2
        pageV.layer.masksToBounds = true
        pageV.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        addSubview(pageV)
        self.pageView = pageV
        pageV.snp.makeConstraints { (make) in
            make.top.equalTo(self.mainCollectionView.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.PageViewWidth)
            make.height.equalTo(4)
        }
        let rollV = UIView()
        rollV.layer.cornerRadius = 2
        rollV.layer.masksToBounds = true
        rollV.backgroundColor = #colorLiteral(red: 1, green: 0.6303351521, blue: 0, alpha: 1)
        pageV.addSubview(rollV)
        self.rollLine = rollV
        rollV.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            
            let rollWidth = getUnitWidth(type: self.rowNumber, count: self.saveModle.count, width: self.PageViewWidth)
            make.width.equalTo(rollWidth)
        }
        
    }
}
extension DFCollectionView:UIScrollViewDelegate  {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.1) {
            let offset: CGPoint = scrollView.contentOffset
            var frame : CGRect   = self.rollLine.frame
            
            frame.origin.x = 0 + offset.x * (self.pageView.frame.size.width - self.rollLine.frame.size.width) / (scrollView.contentSize.width - scrollView.frame.size.width)
            
            self.rollLine.frame = frame
            
        }
    }
    
}
// MARK: - UICollectionViewDelegate,UICollectionViewDataSource
extension DFCollectionView : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.saveModle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = self.saveModle[indexPath.row];
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DFUnitModularCell.ID, for: indexPath) as! DFUnitModularCell
        cell.layoutwithModel(model: model)
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.collectionView(self, didSelectItemAt: indexPath)
    }
}
extension DFCollectionView {
    
    //MARK: - lazyload
    func getMainCollectionView() -> BaseUICollectionView {
        let collectionView :BaseUICollectionView!
        if self.rowNumber == .SingleLine {
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
            layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
            layout.scrollDirection = .horizontal
            collectionView = BaseUICollectionView.init(frame: .zero, collectionViewLayout: layout)
        } else {
            let layout = DFHorizontalPageLayout()
            layout.itemCountPerRow = 9
            layout.rowCount = 2
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
            layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
            layout.scrollDirection = .horizontal
            collectionView = BaseUICollectionView.init(frame: .zero, collectionViewLayout: layout)
        }
        collectionView.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.bounces = false
        collectionView.alwaysBounceHorizontal = true
        collectionView.alwaysBounceVertical = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(UINib(nibName: "DFUnitModularCell", bundle: nil), forCellWithReuseIdentifier: DFUnitModularCell.ID)
        return collectionView
    }
    
}
