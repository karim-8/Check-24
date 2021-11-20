//
//  ProductsHomeViewModel.swift
//  Check-24
//
//  Created by KarimAhmed on 18/11/2021.
//

import UIKit

class ProductsHomeViewModel {
    
    
    //MARK:- PROPERTIES
    var productDetails = [Products]()
    var productFilters = [String]()
    var headerTitle = ""
    var headerSubTitle = ""
    
    
    //MARK:- GET PRODUCTS DATA
    func getProductsData(linkType: UrlEndPoints) {
        let url = Request(url: linkType.rawValue, param: "")
        NetworkClient().get(request: url) { [weak self] result in
            switch result {
            case .success(let product):
                self?.decodeResult(jsonData: product)
            case .failure(let error):
                print("Error in VM... \(error)")
            }
        }
    }
    
    //MARK:- DECODE JSON RESULT
    func decodeResult(jsonData: Data) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        let eventsData = try? decoder.decode([BaseProduct].self, from: jsonData)
        if let events = eventsData {
            self.productDetails = events[0].products ?? [Products]()
            self.productFilters = events[0].filters ?? [String]()
            self.headerTitle = events[0].header?.headerTitle ?? ""
            self.headerSubTitle = events[0].header?.headerDescription ?? ""
        }
    }
    
    //MARK:- GET PRODUCT DETAILS
    func getProductDetails() -> [Products] {
        return self.productDetails
    }
    
    //MARK:- GET FILTERS
    func getFilters() -> [String]{
        return self.productFilters
    }
    
    //MARK:- GET TITLE
    func getTitle() -> String {
        return self.headerTitle
    }
    
    func getdescription() -> String {
        return self.headerSubTitle
    }
    
    //MARK:- GET SWIPING PAGE
    func getSwipigPage(countriesTable: UITableView, scrollView: UIScrollView, currentPageIndex: Int, eventType: String) -> Int {
        
        var pageIndex = currentPageIndex
        let position = scrollView.contentOffset.y
        
        if position > (countriesTable.contentSize.height-100-scrollView.frame.size.height) {
            
            if pageIndex == 4 {
                pageIndex = 3
                
            }else {
                if currentPageIndex < 3 {
                    pageIndex += 1
                    getEventByType(currentPageIndex: currentPageIndex , productsTable: countriesTable)
                }
            }
        }
        return pageIndex
    }
    
    //MARK:- GET EVENT BY TYPE
    func getEventByType(currentPageIndex: Int, productsTable: UITableView) {
        getProductsData(linkType: .ProductUrl)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let updatedEvents = self.getProductDetails()
            self.productDetails = updatedEvents
            productsTable.reloadData()
        }
        
    }
}
