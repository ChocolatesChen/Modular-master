//
//  ViewController.swift
//  Modular-master
//
//  Created by cg on 2018/12/27.
//  Copyright © 2018 df. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        if row == 0 {
            let stackVC = DFStackViewVC()
            navigationController?.pushViewController(stackVC, animated: true)
        } else {
            let collectionVC = DFCollectionViewVC()
            navigationController?.pushViewController(collectionVC, animated: true)
        }
    }
}

