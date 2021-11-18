//
//  SplashScreenViewModel.swift
//  Check-24
//
//  Created by KarimAhmed on 18/11/2021.
//

import UIKit

//MARK:- URL END POINTS
enum UrlEndPoints: String {
    case ProductUrl = "http://app.check24.de/products-test.json"
}

//MARK:- REQUEST
struct Request: RequestProtocol {
    let productsUrl: String?
    let params: String?
    init(url: String, param: String) {
        self.productsUrl = url
        self.params = param
    }
    var url: URL {
        return URL(string: self.productsUrl! + self.params!)!
    }
}

class SplashScreenViewModel {
    
    //MARK:- PROPERTIES
    private let coordinator: SplashScreenCoordinator?
    private let viewController: UIViewController?
    var eventsTypes: BaseProduct?
    //var eventDetails = [EventData]()
    //let presistance = PresesistancService.shared
    
    //MARK:- INIT
    init(coordinator: SplashScreenCoordinator, view: UIViewController) {
        self.coordinator = coordinator
        self.viewController = view
    }
    
    //MARK:- ANIMATE SPLASH LOGO
    func animateSplashLogo(view: UIView, check24Logo: UIImageView) -> UIImageView {
        UIView.animate(withDuration: 3, animations: {
            let size = view.frame.size.width * 3
            let xScale = size - view.frame.size.width
            let yScale = view.frame.size.height - size
            
            check24Logo.frame = CGRect(
                x: -(xScale/2),
                y: yScale/2,
                width: size,
                height: size
            )
        })
        animationExcution(view: view, bevyLogo: check24Logo)
        return check24Logo
    }
    
    //MARK:- ANIMATION EXCUTION
    func animationExcution(view: UIView, bevyLogo: UIImageView) {
        UIView.animate(withDuration: 3, animations: {
            bevyLogo.alpha = 0
        },completion: { animationDone in
            if animationDone {
                DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                    self.coordinator?.navigateTo()
                })
            }
        })
    }
    
    //MARK:- GET EVENTS DATA
    func getEventsData(linkType: UrlEndPoints) {
        let parameters = ""
        let url = Request(url: linkType.rawValue, param: parameters)
        NetworkClient().get(request: url) { [weak self] result in
            switch result {
            case .success(let product):
                self?.decodeResult(jsonData: product, link: linkType)
            case .failure(let error):
                print("Error in VM... \(error)")
            }
        }
    }

    //MARK:- DECODE JSON RESULT
    func decodeResult(jsonData: Data, link: UrlEndPoints) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        print("-------------")
        print("......\(jsonData)")
    }
    
}
