//
//  DFStackView.swift
//  Modular-master
//
//  Created by cg on 2018/12/27.
//  Copyright © 2018 df. All rights reserved.
//

import UIKit
import SnapKit

protocol DFStackViewDelegate {
    func stackView(_ view: DFStackView, didSelectItemAt index: Int)
}
class DFStackView: UIView {

    enum LineMenu:Int {
        case SingleLine = 1
        case MultiLine = 2
    }
    struct UnitViewCGSize {
        static let width      = kScreenWidth / 5
        static let height     = width * 1.17
    }
    private let PageViewWidth:CGFloat     = 60
    
    var ViewSize      = UnitViewCGSize()
    
    private var mainScorll:UIScrollView!
    private var pageView:UIView!
    private var rollLine:UIView!
    public var stackView_RowOne: UIStackView!
    public var stackView_RowTwo: UIStackView!
    
    private var saveModle = [ModularModel]()
    private var rowNumber:NSInteger!
    
    var delegate:DFStackViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    convenience init(rowNumber:NSInteger,model:[ModularModel]) {
        self.init(frame: .zero)
        self.rowNumber = rowNumber
        self.saveModle = model
        createUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func createUI() {
        self.addContentView()
        
    }
    private func addContentView() {
        func getUnitWidth(type:LineMenu,count:Int,width:CGFloat) ->CGFloat {
            let page = (CGFloat(count) / CGFloat(type == .SingleLine ? 5 : 9))
            let rollWidth = CGFloat(width) / page
            return rollWidth
        }
        pageView = UIView.df_getViewWith(UIColor.colorWithHex(hexColor: "#BEBEBE"), superView: self, masonrySet: { (paegV, make) in
            paegV?.df_rounded(2)
            make?.bottom.centerX.equalToSuperview()
            make?.width.equalTo(self.PageViewWidth)
            make?.height.equalTo(4)
        })
        rollLine = UIView.df_getViewWith(UIColor.colorWithHex(hexColor: "#FF8000"), superView: pageView, masonrySet: { (paegV, make) in
            paegV?.df_rounded(2)
            make?.top.left.bottom.equalToSuperview()
            
            let rollWidth = getUnitWidth(type: self.rowNumber == LineMenu.SingleLine.rawValue ? .SingleLine : .MultiLine, count: self.saveModle.count, width: self.PageViewWidth)
            make?.width.equalTo(rollWidth)
        })
        
        mainScorll = UIScrollView.df_getScrollView(withColorHex: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), superView: self, masonrySet: { (scrollerView, make) in
            scrollerView?.delegate = self
            scrollerView?.bounces = false
            scrollerView?.showsVerticalScrollIndicator = false
            scrollerView?.showsHorizontalScrollIndicator = false
            make?.left.right.top.equalToSuperview()
            make?.bottom.equalTo(self.pageView.snp.top).offset(-6)
        })
        stackView_RowOne = UIStackView.getBasicStackView(backGroundColor: UIColor.white, superView: self.mainScorll, masonrySet: { (stackView, make) in
            if self.rowNumber == LineMenu.SingleLine.rawValue {
                make?.edges.equalToSuperview()
                make?.width.equalTo(UnitViewCGSize.width * CGFloat(self.saveModle.count))
            } else {
                make?.top.left.right.equalToSuperview()
                make?.width.equalTo(UnitViewCGSize.width * CGFloat(9))
            }
            make?.height.equalTo(UnitViewCGSize.height)
        })
        
        if rowNumber == LineMenu.MultiLine.rawValue {
            stackView_RowTwo = UIStackView.getBasicStackView(backGroundColor: UIColor.white, superView: self.mainScorll, masonrySet: { (stackView, make) in
                make?.top.equalTo(self.stackView_RowOne.snp.bottom)
                make?.left.height.equalTo(self.stackView_RowOne)
                make?.width.equalTo(UnitViewCGSize.width * CGFloat(self.saveModle.count - 9))
            })
            
            for i in 0..<9{
                let v = UnitView.init(imageName: self.saveModle[i].image, title: self.saveModle[i].title, index:i)
                v.UnitViewBlock = { view,`index` in
                    self.delegate.stackView(self, didSelectItemAt: index)
                }
                stackView_RowOne.addArrangedSubview(v)
            }
            
            for i in 9..<self.saveModle.count{
                let v = UnitView.init(imageName: self.saveModle[i].image, title: self.saveModle[i].title, index:i)
                v.UnitViewBlock = { view,`index` in
                    self.delegate.stackView(self, didSelectItemAt: index)
                }
                stackView_RowTwo.addArrangedSubview(v)
            }
        } else {
            for i in 0..<self.saveModle.count{
                let v = UnitView.init(imageName: self.saveModle[i].image, title: self.saveModle[i].title, index:i)
                v.UnitViewBlock = { view,`index` in
                    self.delegate.stackView(self, didSelectItemAt: index)
                }
                stackView_RowOne.addArrangedSubview(v)
            }
        }
        layoutIfNeeded()
    }
    override func layoutSubviews() {
        layoutIfNeeded()
    }
}
extension DFStackView:UIScrollViewDelegate  {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.1) {
            let offset: CGPoint = scrollView.contentOffset
            var frame: CGRect = self.rollLine.frame
            
            frame.origin.x = 0 + offset.x * (self.pageView.frame.size.width - self.rollLine.frame.size.width) / (scrollView.contentSize.width - scrollView.frame.size.width)
            
            self.rollLine.frame = frame
            
        }
    }
    
}
class UnitView: UIView {
    private var imageView:UIImageView!
    private var titleLabel:UILabel!
    
    var UnitViewBlock: ((_ view:UnitView,_ index:Int) -> Void)? = nil
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    convenience init(imageName:String,title:String,index:Int) {
        self.init(frame: .zero)
        self.tag = index
        self.backgroundColor = UIColor.clear
        
        imageView = UIImageView.df_getImageView(withImageName: imageName, superView: self) { (imageV, make) in
            imageV?.contentMode = .scaleAspectFit
            let imageW = kScreenWidth / 5 - 10
            make?.top.equalToSuperview().inset(7)
            make?.centerX.equalToSuperview()
            make?.width.equalTo(imageW)
            make?.height.equalTo(imageW)
        }
        titleLabel = UILabel.df_getLabel(withFontSize: 12, fontStyle: .Light, superView: self, masonrySet: { (label, make) in
            label?.text = title
            label?.textAlignment = .center
            make?.left.right.bottom.equalToSuperview()
            make?.top.equalTo(self.imageView.snp.bottom)
        })
        
        
        self.isUserInteractionEnabled = true
        let tap =  UITapGestureRecognizer(target: self, action: #selector(unitViewClicked))
        self.addGestureRecognizer(tap)
    }
    @objc func unitViewClicked(sender:UITapGestureRecognizer) {
        if UnitViewBlock != nil {
            UnitViewBlock!(self,self.tag)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
