//
//  SplashScreenViewModel.swift
//  Check-24
//
//  Created by KarimAhmed on 18/11/2021.
//

import Foundation

class SplashScreenViewModel {

    //MARK:- URL END POINTS
    enum UrlEndPoints: String {
        case EventType =    "http://private-7466b-eventtuschanllengeapis.apiary-mock.com/eventtypes"
        case Eventdetails = "http://private-7466b-eventtuschanllengeapis.apiary-mock.com/events"
    }

    //MARK:- REQUEST
//    struct Request: RequestProtocol {
//        let eventsUrl: String?
//        let params: String?
//        init(url: String, param: String) {
//            self.eventsUrl = url
//            self.params = param
//        }
//        var url: URL {
//            return URL(string: self.eventsUrl! + self.params!)!
//        }
//    }

        
        //MARK:- PROPERTIES
     //   private let coordinator: SplashScreenCoordinator
     //   private let viewController: UIViewController
//        var eventsTypes = [EventType]()
//        var eventDetails = [EventData]()
//        let presistance = PresesistancService.shared
        
        //MARK:- INIT
//        init(coordinator: SplashScreenCoordinator, view: UIViewController) {
//            self.coordinator = coordinator
//            self.viewController = view
//        }
        
        //MARK:- ANIMATE SPLASH LOGO
//        func animateSplashLogo(view: UIView, bevyLogo: UIImageView) -> UIImageView {
//            UIView.animate(withDuration: 3, animations: {
//                let size = view.frame.size.width * 3
//                let xScale = size - view.frame.size.width
//                let yScale = view.frame.size.height - size
//
//                bevyLogo.frame = CGRect(
//                    x: -(xScale/2),
//                    y: yScale/2,
//                    width: size,
//                    height: size
//                )
//            })
//            animationExcution(view: view, bevyLogo: bevyLogo)
//            return bevyLogo
//        }
        
        //MARK:- ANIMATION EXCUTION
//        func animationExcution(view: UIView, bevyLogo: UIImageView) {
//            UIView.animate(withDuration: 3, animations: {
//                bevyLogo.alpha = 0
//            },completion: { animationDone in
//                if animationDone {
//                    DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
//                        self.coordinator.navigateTo(view: self.viewController, eventTypeData: self.eventsTypes, eventsdetails: self.eventDetails)
//                    })
//                }
//            })
//        }
//
//        //MARK:- GET EVENTS DATA
//        func getEventsData(linkType: UrlEndPoints) {
//            let parameters = linkType == UrlEndPoints.EventType ? "" : "?event_type=Sports" + "&page=0"
//            let url = Request(url: linkType.rawValue, param: parameters)
//            NetworkClient().get(request: url) { [weak self] result in
//                switch result {
//                case .success(let event):
//                    self?.decodeResult(jsonData: event, link: linkType)
//                case .failure(let error):
//                    print("Error in VM... \(error)")
//                    self?.fetchData(link: linkType)
//                }
//            }
        
}
