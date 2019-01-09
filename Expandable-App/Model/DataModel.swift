//
//  DataModel.swift
//  Expandable-App
//
//  Created by Ganesh on 08/01/19.
//  Copyright © 2019 Ganesh. All rights reserved.
//

import Foundation


struct DataModel {
    
    var name: String!
    var rows: [String]!
    var collapsed: Bool!
    
    init(name: String, rows: [String], collapsed: Bool = false) {
        self.name = name
        self.rows = rows
        self.collapsed = collapsed
    }
    
}

