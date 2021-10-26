//
//  CartTableViewController.swift
//  Assignment3-E-Commerce
//
//  Created by Coditas on 04/10/21.
//  Copyright © 2021 Coditas. All rights reserved.
//

import UIKit
import CoreData

class CartTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, removeFromCartButtonIndex {
    
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     var cartProduct = [Product]()
    
    var cartItem = [ProductInfo]()
        var totalPrice : Int = 0
    
        let viewController = CollectionViewCell()
    
    let application = UIApplication.shared
    var indexRow : Int = 0
        
        override func viewDidLoad() {
            super.viewDidLoad()
          
            cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
           
//            let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
//            footer.backgroundColor = .gray
//            cartTableView.tableFooterView = footer
//
//            let totalPriceLabel = UILabel(frame: footer.bounds)
//            totalPriceLabel.text = "Total Price: \(totalPrice)"
//            totalPriceLabel.textAlignment = .center
//            footer.addSubview(totalPriceLabel)
            
            //loadData()
            
        }
        override func viewWillAppear(_ animated: Bool) {
            loadData()
        }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return cartItem.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = cartTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartTableViewCell
            
            if let img = try? Data(contentsOf: URL(string: cartItem[indexPath.row].productImg!)!){
                cell.cProductImage.image = UIImage(data: img)
            }
            else{
                cell.cProductImage.image = UIImage(systemName: "person.crop.circle")
            }
                //ProductInfo.image = UIImage(data: img)
            cell.cProductNameLbl.text = cartItem[indexPath.row].productname
            cell.cVendorAddressLbl.text = cartItem[indexPath.row].vendoraddress
            cell.cVendorNameLbl.text = cartItem[indexPath.row].vendorname
            cell.priceLbl.text = "Price: "+cartItem[indexPath.row].price!
            
            cell.removeDelegate = self
            //cell.callVendorDelegate = self
            cell.index = indexPath
            
            indexRow = indexPath.row
            print("indexrow",indexRow)
//            let a = Int(cartItem[indexPath.row].price!)
//            totalPrice += a!
//            totalPriceLabel.text = "Total Price : \(totalPrice)"
            return cell
        }
    
    func loadData() {
        //cartTableView.reloadData()

           let request : NSFetchRequest<ProductInfo> = ProductInfo.fetchRequest()
           let result = try! context.fetch(request)
        var totalPriceArray = [String]()
        cartItem = result
        //totalPriceLabel.text = "Total Price: \(totalPrice)"
        totalPrice = 0
        for i in result{
            //totalPrice = 0
            totalPriceArray.append(i.productname!)
            let a = Int( i.price!)
            totalPrice += a!
            totalPriceLabel.text = "Total Price: Rs \(totalPrice)/-"

        }

       cartTableView.reloadData()

       }
    
    func removeFromCartButton(index: Int) {
        context.delete(cartItem[index])
        let a = Int(cartItem[index].price!)
        totalPrice = totalPrice - a!
        //print(totalPrice)
        totalPriceLabel.text = "Total Price:\(totalPrice)/-"
        cartItem.remove(at: index)
        print("remove",cartItem.endIndex)
       
        
        do{
            try context.save()
        }catch{
            print("Error in deleting data",error)
        }
        cartTableView.reloadData()
    }
    
    func callVendor(index: Int) {
        if let phoneCall = URL(string: cartItem[index].phoneNumber!){
            if application.canOpenURL(phoneCall){
                application.open(phoneCall, options: [:], completionHandler: nil)
            }
            else{
                //alert
                showAlert()
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cartTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
       func showAlert(){
                    let alert = UIAlertController(title: "Not Reachable", message: "Enter correct number", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: { (action) in
    
                    }))
                    present(alert, animated: true)
                }

   
}
