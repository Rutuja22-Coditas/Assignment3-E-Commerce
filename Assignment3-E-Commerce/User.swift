//
//  User.swift
//  Assignment3-E-Commerce
//
//  Created by Coditas on 03/10/21.
//  Copyright © 2021 Coditas. All rights reserved.
//

import Foundation

struct User : Codable{
    var products:[Product]
    
}
struct Product : Codable {
    var productname : String
    var price : String
    var vendorname : String
    var vendoraddress : String
    var productImg : String
    //var productGallery : String
    var phoneNumber : String
}
