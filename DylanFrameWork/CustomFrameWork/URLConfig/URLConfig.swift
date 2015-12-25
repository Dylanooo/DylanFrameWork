//
//  URLConfig.swift
//  DylanFrameWork
//
//  Created by Dylan on 15/12/23.
//  Copyright © 2015年 Dylan.Lee. All rights reserved.
//

import Foundation

extension HTTPRequestManager {
    enum URL: String {
        case kBaidu = "http://shijia.mall.autohome.com.cn/api/car/getBrand"
        case kFuck  = "http://www.baidu.com"
    }
    
    static var documentURL: String {
        get {
            return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        }
    }
    
    
}