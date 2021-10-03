//
//  CartTableViewController.swift
//  Assignment3-E-Commerce
//
//  Created by Coditas on 04/10/21.
//  Copyright © 2021 Coditas. All rights reserved.
//

import UIKit

class CartTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var cartTableView: UITableView!
    var cartProduct = [Product]()
        var indexId : Int = 0
        //var productNamee = [String:String]
        var price = 0
        let viewController = CollectionViewCell()
        //let realm = try! Realm()
        //let results = try! Realm().objects(RealmProduct.self)
        
        override func viewDidLoad() {
            super.viewDidLoad()
           //  cartTableView.reloadData()
            DispatchQueue.main.async {
                self.cartTableView.reloadData()
            }
            
            cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
           
    //        DispatchQueue.main.async {
    //            self.cartTableView.reloadData()
    //        }
            
            let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
            footer.backgroundColor = .gray
            cartTableView.tableFooterView = footer
            
            let label = UILabel(frame: footer.bounds)
            label.text = "Total Price: 0"
            label.textAlignment = .center
            footer.addSubview(label)
            
            print("index",indexId)
            
            //viewController.delegate = self
            
            //cartTableView.reloadData()
            
            
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 2
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = cartTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartTableViewCell
            cell.cProductNameLbl.text = "product"
//            cell.cVendorAddressLbl.text = cartProduct[indexPath.row].vendoraddress
//            cell.cVendorNameLbl.text = cartProduct[indexPath.row].vendorname
//            cell.priceLbl.text = cartProduct[indexPath.row].price
            
            //cell.removeDelegate = self
            //cell.index = indexPath
            
            return cell
        }
//        func remove(index: Int) {
//
//            do{
//                try realm.write{
//                    realm.delete(results[index])
//                }
//                cartTableView.reloadData()
//
//            }
//            catch{
//                print("error in removing the product",error)
//            }
//        }
    
   
}
