//
//  ProductsTableView.swift
//  Check-24
//
//  Created by KarimAhmed on 18/11/2021.
//

import UIKit

//MARK:- EVENTS TABLE VIEW DELEGATE & DATA SOURCE
extension ProductsHomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.isActive {
            return filteredProducts.count
        }
        return productsDetails?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "availbleCell", for: indexPath) as? ProdHomeTableViewCell
            cell?.ProductTitle.text = productsDetails?[indexPath.row].name
            //cell?.cellImage.image = ""//productsDetails?[indexPath.row].imageURL
            cell?.productDescription.text = productsDetails?[indexPath.row].description
           cell?.productprice.text = "Price: \(String(describing: productsDetails?[indexPath.row].price))"
            
           //TODO: Rating
            return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
 
     //   let detailsVc = ProductsDetailsViewController()
     //   navigationController?.pushViewController(detailsVc, animated: true)
        
        
        let productsHomeviewcotroller = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "details") as? ProductsDetailsViewController)!
        
//        let navigationController = UINavigationController(rootViewController: productsHomeviewcotroller!)
//        navigationController.modalTransitionStyle = .crossDissolve
//        navigationController.modalPresentationStyle = .fullScreen
//        navigationController.present(navigationController, animated: true, completion: nil)

                 
                self.present(productsHomeviewcotroller, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
