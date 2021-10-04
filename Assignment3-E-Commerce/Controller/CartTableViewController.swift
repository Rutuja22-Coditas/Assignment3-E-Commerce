//
//  CartTableViewController.swift
//  Assignment3-E-Commerce
//
//  Created by Coditas on 04/10/21.
//  Copyright © 2021 Coditas. All rights reserved.
//

import UIKit
import CoreData

class CartTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var cartTableView: UITableView!
    
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var cartProduct = [Product]()
    
    var cartItem = [ProductInfo]()
        var indexId : Int = 0
        //var productNamee = [String:String]
        var price = 0
        let viewController = CollectionViewCell()
        //let realm = try! Realm()
        //let results = try! Realm().objects(RealmProduct.self)
        
        override func viewDidLoad() {
            super.viewDidLoad()
           //  cartTableView.reloadData()
//            DispatchQueue.main.async {
//                self.cartTableView.reloadData()
//            }
            
            cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
           
            let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
            footer.backgroundColor = .gray
            cartTableView.tableFooterView = footer
            
            let label = UILabel(frame: footer.bounds)
            label.text = "Total Price: 0"
            label.textAlignment = .center
            footer.addSubview(label)
            
            print("index",indexId)
            //cartTableView.reloadData()
            
            loadData()
            
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return cartItem.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = cartTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartTableViewCell
            cell.cProductNameLbl.text = cartItem[indexPath.row].productname
//            cell.cVendorAddressLbl.text = cartProduct[indexPath.row].vendoraddress
//            cell.cVendorNameLbl.text = cartProduct[indexPath.row].vendorname
//            cell.priceLbl.text = cartProduct[indexPath.row].price
            
            //cell.removeDelegate = self
            //cell.index = indexPath
            
            return cell
        }
    
    func loadData() {
           let request : NSFetchRequest<ProductInfo> = ProductInfo.fetchRequest()
           do{
               cartItem = try context.fetch(request)
           }
           catch{
               print("error fetching data from context\(error)")
           }
        
        cartTableView.reloadData()
           
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
