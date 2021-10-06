//
//  CartTableViewCell.swift
//  Assignment3-E-Commerce
//
//  Created by Coditas on 04/10/21.
//  Copyright © 2021 Coditas. All rights reserved.
//

import UIKit

protocol removeFromCartButtonIndex {
    func removeFromCartButton(index : Int)
}

protocol callVendorButton {
    func callVendor(index : Int)
}

class CartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cProductImage: UIImageView!
    @IBOutlet weak var cProductNameLbl: UILabel!
    @IBOutlet weak var cVendorNameLbl: UILabel!
    @IBOutlet weak var cVendorAddressLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    @IBAction func removeFromCartButton(_ sender: Any) {
        removeDelegate?.removeFromCartButton(index: index!.row)
    }
    
    @IBAction func callVendorButton(_ sender: Any) {
        callVendorDelegate?.callVendor(index: index!.row)
    }
    
    var removeDelegate : removeFromCartButtonIndex?
    var callVendorDelegate : callVendorButton?
    var index : IndexPath?
    //       @IBOutlet weak var cVendorAddressLbl: UILabel!
//       var removeDelegate : removeFromCart?
//       var index:IndexPath?
//       @IBAction func callVendorButton(_ sender: Any) {
//       }
//       @IBAction func removeFromCartButton(_ sender: Any) {
//           removeDelegate?.remove(index: index!.row)
//
//       }
//       @IBOutlet weak var priceLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
