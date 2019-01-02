//
//  DFStackViewVC.swift
//  Modular-master
//
//  Created by cg on 2018/12/27.
//  Copyright © 2018 df. All rights reserved.
//

import UIKit

class DFStackViewVC: BaseVC {
    var data = [ModularModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "StackView"
        self.view.backgroundColor = UIColor.white
        
        let imageArr = [
            "001-placeholder",
            "002-parking",
            "003-camping",
            "004-goverment",
            "005-shopping-basket",
            "006-police-station",
            "007-car",
            "008-hospital",
            "009-camera",
            "010-garage",
            "011-theater",
            "012-wc",
            "013-soccer",
            "014-credit-card",
            "015-target",
            "016-metro",
            "017-taxi-stop",
            "018-hospital-1"
        ]
        for i in 0..<17 {
            let model = ModularModel()
            model.channelId = "\(100 + i)"
            model.title = "\(222 + i)"
            model.image = imageArr[i]
            data.append(model)
        }
        
        let stackView_Single = DFStackView.init(rowNumber: 1, model: data)
        stackView_Single.delegate = self
        self.view.addSubview(stackView_Single)
        
        let stackView_Multi = DFStackView.init(rowNumber: 2, model: data)
        stackView_Multi.delegate = self
        self.view.addSubview(stackView_Multi)
        let viewHeight = (kScreenWidth / 5 * 1.3)
        stackView_Single.snp.makeConstraints { (make) in
            make.top.equalTo(kSystemNavigationBarHeight)
            make.left.right.equalToSuperview()
            make.height.equalTo(viewHeight + 7)
        }
        
        stackView_Multi.snp.makeConstraints { (make) in
            make.top.equalTo(stackView_Single.snp.bottom).offset(15)
            make.left.right.equalToSuperview()
            make.height.equalTo(viewHeight * 2)
        }
    }
    

}
extension DFStackViewVC : DFStackViewDelegate {
    
    func stackView(_ view: DFStackView, didSelectItemAt index: Int) {
        NSLog("\(self.data[index].title)")
    }
    
}
