//
//  Price.swift
//  Check-24
//
//  Created by KarimAhmed on 18/11/2021.
//

import Foundation

struct Price : Codable {
    let value : Double?
    let currency : String?

    enum CodingKeys: String, CodingKey {

        case value = "value"
        case currency = "currency"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        value = try values.decodeIfPresent(Double.self, forKey: .value)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
    }

}
