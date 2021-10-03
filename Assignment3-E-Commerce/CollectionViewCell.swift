//
//  CollectionViewCell.swift
//  Assignment3-E-Commerce
//
//  Created by Coditas on 03/10/21.
//  Copyright © 2021 Coditas. All rights reserved.
//

import UIKit


protocol add2CartButtonIndex {
    func onClickButton(index: Int)
}

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var vendorNameLbl: UILabel!
    @IBOutlet weak var vendorAddressLbl: UILabel!
    @IBAction func addToCartPressed(_ sender: UIButton) {
        
        cellIndexDelegate?.onClickButton(index: index!.row)

    }
    
    var cellIndexDelegate: add2CartButtonIndex?
    var index : IndexPath?
    var buttonColor = true
    
}
