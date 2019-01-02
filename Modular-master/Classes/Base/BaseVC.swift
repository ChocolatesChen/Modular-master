//
//  BaseVC.swift
//  Modular-master
//
//  Created by cg on 2018/12/27.
//  Copyright © 2018 df. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let leftBarItem = UIBarButtonItem.init(image: UIImage.init(named: "返回"), style: .plain, target: self, action: #selector(leftBarAction))
        self.navigationItem.leftBarButtonItem = leftBarItem
    }
    
    ///点击左按钮方法
    @objc func leftBarAction() {
        
        guard let navigationController = self.navigationController else { return }
        
        if self.presentingViewController != nil {
            if navigationController.viewControllers.count == 1 {
                self.dismiss(animated: true, completion: nil)
            } else {
                navigationController.popViewController(animated: true)
            }
        } else {
            if navigationController.viewControllers.count > 1 {
                navigationController.popViewController(animated: true)
            }
        }
    }

}
