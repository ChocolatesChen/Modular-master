//
//  AppMacros.swift
//  Modular-master
//
//  Created by cg on 2018/12/27.
//  Copyright © 2018 df. All rights reserved.
//

import Foundation
import UIKit

//自定义调试阶段log
func NSLog(filePath: String = #file, rowCount: Int = #line) {
    #if DEBUG
    let fileName = (filePath as NSString).lastPathComponent.replacingOccurrences(of: ".Swift", with: "")
    print("-----------" + fileName + "/" + "\(rowCount)" + "\n")
    #endif
}

func NSLog<T>(_ message: T, filePath: String = #file, rowCount: Int = #line) {
    #if DEBUG
    let fileName = (filePath as NSString).lastPathComponent.replacingOccurrences(of: ".Swift", with: "")
    print("-----------" + fileName + "/" + "\(rowCount)" + " \(message)" + "\n")
    #endif
}

//系统版本
let kSystemVersion = UIDevice.current.systemVersion

//系统版本
let IOS9  = (Double(kSystemVersion)! >= 9.0)

//frame
let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth  = UIScreen.main.bounds.size.width
let kScreenBounds = UIScreen.main.bounds

//设备
let kDevice_iPhone4          = (kScreenHeight == 480.0)
let kDevice_iPhone5_SE       = (kScreenHeight == 568.0)
let kDevice_iPhone6_7_8      = (kScreenHeight == 667.0)
let kDevice_iPhone6_7_8_Plus = (kScreenHeight == 736.0)
let kDevice_iPhoneX_Xs       = (kScreenHeight == 812.0)
let kDevice_iPhoneXR_Max     = (kScreenHeight == 896.0)
let kDevice_iPhoneX_Series   = kDevice_iPhoneX_Xs || kDevice_iPhoneXR_Max


//设备 系统高度
let kSystemNavigationBarHeight:CGFloat  = (kDevice_iPhoneX_Series ? 88 : 64)
let kSystemTopMargin:CGFloat            = (kDevice_iPhoneX_Series ? 44 : 0)
let kSystemBottomMargin:CGFloat         = (kDevice_iPhoneX_Series ? 34 : 0)
