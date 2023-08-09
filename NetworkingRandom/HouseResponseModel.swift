//
//  HouseResponseModel.swift
//  NetworkingRandom
//
//  Created by Санжар Бахытбек on 30.11.2022.
//

import Foundation

struct HouseResponseModel: Decodable {
    let id: String
    let name: String
    let houseColours: String
    let animal: String
    let element: String
    let heads: [HouseHead]
}

struct HouseHead: Decodable {
    let firstName: String
    let lastName: String
}
