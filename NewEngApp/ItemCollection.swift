//
//  ItemCollection.swift
//  NewEngApp
//
//  Created by admin on 12/3/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class ItemCollection: NSObject {
    var name: String?
    var img: String?
    var content: String?
    
    init(name: String, nameImg: String, content: String) {
        self.name = name
        self.img = nameImg
        self.content = content
    }
}
