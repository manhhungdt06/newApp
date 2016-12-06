//
//  SettingParam.swift
//  NewEngApp
//
//  Created by admin on 12/3/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit
class SettingParam {

    var level: String?
    var language: String?
    var time: Int!
    init (level: String, language: String, time: Int) {
        self.level = level
        self.language = language
        self.time = time
    }
    
}
