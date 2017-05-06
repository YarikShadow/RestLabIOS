//
//  Food.swift
//  RestLab
//
//  Created by Admin on 05.01.17.
//  Copyright © 2017 Yaroslav. All rights reserved.
//

import UIKit

struct Food {
    
    let name: String
    let value: String
    let id: Int
    
    
    init(name:String, value: String, id:Int) {
        self.name = name
        self.value = value
        self.id = id
    }
}
