//
//  ViewController.swift
//  Assignment3-E-Commerce
//
//  Created by Coditas on 03/10/21.
//  Copyright © 2021 Coditas. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, add2CartButtonIndex {

    @IBOutlet weak var collectionView: UICollectionView!
    var product = [Product]()
    var productViewModel = ProductViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        productViewModel.fetchData{
            data in
            self.product = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
        //collectionView.reloadData()

        //collectionView.reloadData()
        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            //print(product.count)
            return product.count
            
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
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
       }
//
//            func showAlert(){
//                let alert = UIAlertController(title: "Go To Cart", message: "Product is already in cart", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: { (action) in
//
//                }))
//                present(alert, animated: true)
//            }
    
}

