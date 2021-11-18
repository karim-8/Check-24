//
//  ProductsHomeScrollView.swift
//  Check-24
//
//  Created by KarimAhmed on 18/11/2021.
//

import UIKit

//MARK:- SCROLL VIEW DELEGTES METHODS
extension ProductsHomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let currentPage = viewModel?.getSwipigPage(countriesTable: countriesTable, scrollView: scrollView, currentPageIndex: currentPageIndex, eventType: eventTypeName)
        currentPageIndex = currentPage ?? 0
    }
}

