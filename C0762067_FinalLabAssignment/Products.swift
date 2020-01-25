//
//  Products.swift
//  C0762067_FinalLabAssignment
//
//  Created by Mac on 2020-01-24.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import CoreData

class Products{
    internal init(pname: String, pID: Int16, pDescription: String, pPrice: Double ,quna : Int16) {
        self.pname = pname
        self.pID = pID
        self.pDescription = pDescription
        self.pPrice = pPrice
        self.quantity = quna
    }
    
    
    var pname  :  String
    var  pID : Int16
    var pDescription : String
    var pPrice : Double
    var quantity : Int16
    
    
}
