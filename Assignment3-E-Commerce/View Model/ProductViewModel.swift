//
//  ProductViewModel.swift
//  Assignment3-E-Commerce
//
//  Created by Coditas on 03/10/21.
//  Copyright © 2021 Coditas. All rights reserved.
//

import Foundation

class ProductViewModel{
    var product = [Product]()
    
    func fetchData(completion : @escaping ([Product])->()){
        let urlString = "https://mobiletest-hackathon.herokuapp.com/getdata/"
        if let url = URL(string: urlString){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error == nil{
                    do{
                        let sharedurlSession = try JSONDecoder().decode(User.self, from: data!)
                        self.product = sharedurlSession.products
                        completion(sharedurlSession.products)
                    }
                    catch{
                        print("error:",error)
                    }
                }
            }.resume()
        }
    }
    
}
