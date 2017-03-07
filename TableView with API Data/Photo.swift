//
//  Photo.swift
//  TableView with API Data
//
//  Created by Hayden Goldman on 3/6/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import Foundation

class Photo {
    
    var id :Int
    var title :String
    var thumbnailUrl :String
    
    init(id :Int, title :String, thumbnailUrl :String) {
        self.id = id
        self.title = title
        self.thumbnailUrl = thumbnailUrl
    }
}
