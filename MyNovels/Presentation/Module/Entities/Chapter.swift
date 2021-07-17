//
//  Chapter.swift
//  MyNovels
//
//  Created by Orken Serik on 18.07.2021.
//

import Foundation

struct Chapter: Codable {
    let udid: String
    let index, price: Int
    let paid, unlocked, title, dataDescription: String

    enum CodingKeys: String, CodingKey {
        case udid, index, price, paid, unlocked, title
        case dataDescription = "description"
    }
}
