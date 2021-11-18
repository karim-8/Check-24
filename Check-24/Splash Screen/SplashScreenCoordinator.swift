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
    func navigateTo() {
        let viewModel: HomeEventsViewModel = HomeEventsViewModel()
        let homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "home") as? HomeEventsViewController
        homeViewController?.viewModel = viewModel
        homeViewController?.menuTitles = eventTypeData
        homeViewController?.eventDetails = eventsdetails
        let navigationController = UINavigationController(rootViewController: homeViewController!)
        navigationController.modalTransitionStyle = .crossDissolve
        navigationController.modalPresentationStyle = .fullScreen
        view.present(navigationController, animated: true, completion: nil)
    }
}

