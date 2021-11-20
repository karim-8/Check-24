//
//  SplashScreenCoordinator.swift
//  Check-24
//
//  Created by KarimAhmed on 18/11/2021.
//

import UIKit

class SplashScreenCoordinator {
    
    var navigationView: UIViewController?
    
    init(view: UIViewController) {
        navigationView = view
    }
    
    //MARK:- NAVIGATE TO
    func navigateTo(productDetails: [Products], productFilters: [String], headerTitle: String, headerSubTitle: String ) {
        let viewModel: ProductsHomeViewModel = ProductsHomeViewModel()
        let coordinator: ProductsHomeCoordinator = ProductsHomeCoordinator()
        
        let productsHomeviewcotroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "home") as? ProductsHomeViewController
        
        //
        productsHomeviewcotroller?.viewModel = viewModel
        productsHomeviewcotroller?.coordinator = coordinator
        
        productsHomeviewcotroller?.menuTitles = productFilters
        productsHomeviewcotroller?.productsDetails = productDetails
        productsHomeviewcotroller?.headerTitle = headerTitle
        productsHomeviewcotroller?.headerSubTitle = headerSubTitle
                
        let navigationController = UINavigationController(rootViewController: productsHomeviewcotroller!)
        navigationController.modalTransitionStyle = .crossDissolve
        navigationController.modalPresentationStyle = .fullScreen
        navigationView?.present(navigationController, animated: true, completion: nil)
    }
}

