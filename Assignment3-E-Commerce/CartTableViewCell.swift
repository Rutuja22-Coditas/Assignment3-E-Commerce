//
//  CartTableViewCell.swift
//  Assignment3-E-Commerce
//
//  Created by Coditas on 04/10/21.
//  Copyright © 2021 Coditas. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cProductImage: UIImageView!
    @IBOutlet weak var cProductNameLbl: UILabel!
    @IBOutlet weak var cVendorNameLbl: UILabel!
    @IBOutlet weak var cVendorAddressLbl: UILabel!
    //    @IBOutlet weak var cProductImage: UIImageView!
//       @IBOutlet weak var cProductNameLbl: UILabel!
//       @IBOutlet weak var cVendorNameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBAction func removeFromCartButton(_ sender: Any) {
    }
    @IBAction func callVendorButton(_ sender: Any) {
    }
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
