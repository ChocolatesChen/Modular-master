//
//  ModularModel.swift
//  Modular-master
//
//  Created by cg on 2018/12/27.
//  Copyright © 2018 df. All rights reserved.
//

import UIKit

class ModularModel: NSObject {
    var channelId = ""
    var image = ""
    var title = ""
}

class ModularData: NSObject {
    var rowNumber:Int = 0
    var body: ModularModel?
}
