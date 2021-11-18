//
//  Products.swift
//  Check-24
//
//  Created by KarimAhmed on 18/11/2021.
//


import Foundation

struct BaseProduct : Codable {
    let header : Header?
    let filters : [String]?
    let products : [Products]?
}


