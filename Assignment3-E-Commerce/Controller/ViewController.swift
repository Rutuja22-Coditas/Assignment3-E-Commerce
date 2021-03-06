//
//  ViewController.swift
//  Assignment3-E-Commerce
//
//  Created by Coditas on 03/10/21.
//  Copyright © 2021 Coditas. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, add2CartButtonIndex {

    @IBOutlet weak var collectionView: UICollectionView!
    var product = [Product]()
    var productViewModel = ProductViewModel()
    var cartTableVC = CartTableViewController()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let request : NSFetchRequest<ProductInfo> = ProductInfo.fetchRequest()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        productViewModel.fetchData{
            data in
            self.product = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
        //print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
 
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            //print(product.count)
            return product.count
            
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
            if let img = try? Data(contentsOf: URL(string: product[indexPath.row].productImg)!){
                cell.productImg.image = UIImage(data: img)
            }
            else{
                cell.productImg.image = UIImage(systemName: "person.crop.circle")
            }
            cell.productNameLbl.text = product[indexPath.row].productname
            cell.priceLbl.text = product[indexPath.row].price
            cell.vendorNameLbl.text = product[indexPath.row].vendorname
            cell.vendorAddressLbl.text = product[indexPath.row].vendoraddress
            cell.layer.cornerRadius = 10
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor.black.cgColor
            
            
            cell.cellIndexDelegate = self
            cell.index = indexPath
            //vc.indexId = indexPath.row
            
            
    //        delegate?.add2Cart(productName: product[indexPath.row].productname, vendorAddress: product[indexPath.row].vendoraddress)
            
    //        cell.addToCartPressed.tag = indexPath.row
    //        cell.addToCartPressed.addTarget(self, action: #selector(viewDetail), for: .touchUpInside)
            return cell
        }
   
   func onClickButton(index: Int) {
                print(index,"index is")
    let result = try! context.fetch(request)
    var cartProductsList = [String]()
    
    for i in result{
        cartProductsList.append(i.productname!)
        let a = Int(i.price!)
        var b = 0
        b += a!
        cartTableVC.totalPrice = b
        print("cartProductsList",cartProductsList)
    }
    
    if cartProductsList.contains(product[index].productname){
        showAlert()
    
    }
    else{
              print("else")
              let productInfo = ProductInfo(context: context)
              productInfo.productname = product[index].productname
              productInfo.vendorname = product[index].vendorname
              productInfo.vendoraddress = product[index].vendoraddress
              productInfo.price = product[index].price
              productInfo.productImg = product[index].productImg
              productInfo.phoneNumber = product[index].phoneNumber
              //productInfo.totalPrice = product[index].price
              saveData()
          }
//    for i in result{
//        if i.productname == product[index].productname{
//            showAlert()
//            print("ok")
//            break
//        }
//        else{
//            print("else")
//            let productInfo = ProductInfo(context: context)
//            productInfo.productname = product[index].productname
//            productInfo.vendorname = product[index].vendorname
//            productInfo.vendoraddress = product[index].vendoraddress
//            productInfo.price = product[index].price
//            productInfo.productImg = product[index].productImg
//            productInfo.phoneNumber = product[index].phoneNumber
//            //productInfo.totalPrice = product[index].price
//            saveData()
//        }
//
//    }
    }    
      
    func saveData(){
        do{
              try context.save()
                     print("saved")
           }
           catch{
              print("failed",error)
           }
    }
   
   
    
//    func getData(){
//        //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        //let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductInfo")
//
//       let request : NSFetchRequest<ProductInfo> = ProductInfo.fetchRequest()
//        do{
//            let result = try context.fetch(request)
//            print(result)
//
//        }
//        catch{
//            print("Failed")
//        }
//    }
    
//
//                for i in result{
//                    if i.productname == product[index].productname{
//                        showAlert()
//                        break
//                    }
//                    else{
//                        let realmProduct = RealmProduct()
//                        realmProduct.productname = product[index].productname
//                        realmProduct.price = product[index].price
//                        realmProduct.vendorname = product[index].vendorname
//                        realmProduct.vendoraddress = product[index].vendoraddress
//                        realmProduct.phoneNumber = product[index].phoneNumber
//                        realmProduct.productImg = product[index].productImg
//
//                        try! realm.write({
//                            realm.add(realmProduct)
//                        })
//                    }
//
//            }
       
//
            func showAlert(){
                let alert = UIAlertController(title: "Go To Cart", message: "Product is already in cart", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: { (action) in

                }))
                  present(alert, animated: true)
            }
    
}

