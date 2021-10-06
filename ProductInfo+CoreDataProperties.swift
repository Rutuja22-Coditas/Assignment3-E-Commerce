//
//  ProductInfo+CoreDataProperties.swift
//  Assignment3-E-Commerce
//
//  Created by Coditas on 04/10/21.
//  Copyright © 2021 Coditas. All rights reserved.
//
//

import Foundation
import CoreData


extension ProductInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductInfo> {
        return NSFetchRequest<ProductInfo>(entityName: "ProductInfo")
    }

    @NSManaged public var phoneNumber: String?
    @NSManaged public var price: String?
    @NSManaged public var productImg: String?
    @NSManaged public var productname: String?
    @NSManaged public var vendoraddress: String?
    @NSManaged public var vendorname: String?
    


}
