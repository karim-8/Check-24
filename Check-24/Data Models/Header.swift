//
//  Header.swift
//  Check-24
//
//  Created by KarimAhmed on 18/11/2021.
//

import Foundation

struct Header : Codable {
    
    let headerTitle : String?
    let headerDescription : String?

    enum CodingKeys: String, CodingKey {

        case headerTitle = "headerTitle"
        case headerDescription = "headerDescription"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        headerTitle = try values.decodeIfPresent(String.self, forKey: .headerTitle)
        headerDescription = try values.decodeIfPresent(String.self, forKey: .headerDescription)
    }

}
