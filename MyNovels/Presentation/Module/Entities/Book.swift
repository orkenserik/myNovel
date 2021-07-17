//
//  Book.swift
//  MyNovels
//
//  Created by Orken Serik on 18.07.2021.
//

import Foundation

struct Book: Codable {
    let id: Int
    let cover: String
    let title, author: String
    let symbolsCount: Int
    let tags: String

    enum CodingKeys: String, CodingKey {
        case id, cover, title, author
        case symbolsCount = "symbols_count"
        case tags
    }
}
