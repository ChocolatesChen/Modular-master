//
//  DFUnitModularCell.swift
//  Modular-master
//
//  Created by cg on 2018/12/27.
//  Copyright © 2018 df. All rights reserved.
//

import UIKit

class DFUnitModularCell: UICollectionViewCell {
    static let ID = "unitModularCell"
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func layoutwithModel(model:ModularModel){
        self.imageView.image = UIImage.init(named: model.image)
        self.titleLabel.text = model.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let imageW = kScreenWidth / 5 - 10
        imageView.layer.cornerRadius = imageW/2
        imageView.layer.masksToBounds = true
    }

}
