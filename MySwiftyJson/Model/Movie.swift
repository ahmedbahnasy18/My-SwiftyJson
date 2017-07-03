//
//  Movie.swift
//  MySwiftyJson
//
//  Created by ahmed on 6/3/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import UIKit
import SwiftyJSON

class Movie: NSObject {
    
    var title : String
    var image : String
    var rating : Int
    
    init?(dict : [String : JSON]) {
        guard let title = dict["title"]?.string, let image = dict["image"]?.string, let rating = dict["rating"]?.toInt else {return nil}
        
        self.title = title
        self.image = image
        self.rating = rating
    }
    
}
