//
//  JSON+Extension.swift
//  MySwiftyJson
//
//  Created by ahmed on 6/26/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import Foundation
import SwiftyJSON

extension JSON {
    var toInt : Int? {
        
        if let int = self.int {return int}
        if let string = self.string, let int = Int(string) {
            return int
        }
        return nil
    }
    
    var toBool : Bool? {
        
        if let bool = self.bool {return bool}
        if let int = self.toInt {
            if int == 0 {
                return false
            }else if int == 1 {
                return true
            }
        }
        return nil
    }
}
