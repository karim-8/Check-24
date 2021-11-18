//
//  Products.swift
//  Check-24
//
//  Created by KarimAhmed on 18/11/2021.
//

import Foundation

struct Products : Codable {
    let name : String?
    let type : String?
    let id : Int?
    let color : String?
    let imageURL : String?
    let colorCode : String?
    let available : Bool?
    let releaseDate : Int?
    let description : String?
    let longDescription : String?
    let rating : Double?
    let price : Price?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case type = "type"
        case id = "id"
        case color = "color"
        case imageURL = "imageURL"
        case colorCode = "colorCode"
        case available = "available"
        case releaseDate = "releaseDate"
        case description = "description"
        case longDescription = "longDescription"
        case rating = "rating"
        case price = "price"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        color = try values.decodeIfPresent(String.self, forKey: .color)
        imageURL = try values.decodeIfPresent(String.self, forKey: .imageURL)
        colorCode = try values.decodeIfPresent(String.self, forKey: .colorCode)
        available = try values.decodeIfPresent(Bool.self, forKey: .available)
        releaseDate = try values.decodeIfPresent(Int.self, forKey: .releaseDate)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        longDescription = try values.decodeIfPresent(String.self, forKey: .longDescription)
        rating = try values.decodeIfPresent(Double.self, forKey: .rating)
        price = try values.decodeIfPresent(Price.self, forKey: .price)
    }

}
