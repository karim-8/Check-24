//
//  ViewController.swift
//  Check-24
//
//  Created by KarimAhmed on 18/11/2021.
//

import UIKit
import CoreData
class SplashScreenViewController: UIViewController {
    
    //MARK:- PROPERTIES
    private var check_24_Logo = UIImageView()
    var viewModel: SplashScreenViewModel?
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getProductsTypes()
        setBackGroundColor()
        createSplashLogo()
    }
    
    //MARK:- SETUP VIEW
    private func setupView() {
        let coordinator = SplashScreenCoordinator(view: self)
        viewModel = SplashScreenViewModel(coordinator: coordinator, view: self)
    }
    
    //MARK:- GET PRODUCTS
    func getProductsTypes() {
        viewModel?.getProductsData(linkType: .ProductUrl)
    }
    
    //MARK:- VIEW DID LAYOUT SUBVIEW
    override func viewDidLayoutSubviews() {
        check_24_Logo.center = view.center
        
    }
    
    //MARK:- VIEW DID APPEAR
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            let image = self.viewModel?.animateSplashLogo(view: self.view, check24Logo: self.check_24_Logo)
            self.check_24_Logo = image!
        })
    }
    
    //MARK:- SET BACKGROUND COLOR
    private func setBackGroundColor() {
        view.backgroundColor = UIColor(red: 0/255, green: 117/255, blue: 227/255, alpha: 1.0)
    }
    
    //MARK:- CRETATE SPLASH LOGO
    private func createSplashLogo() {
        check_24_Logo = {
            let logoImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            logoImage.image = UIImage(named: "chech-logo")
            //logoImage.sizeToFit()
            return logoImage
        }()
        view.addSubview(check_24_Logo)
    }
    
    //MARK:- DEINIT
    deinit {
        viewModel = nil
    }
}
