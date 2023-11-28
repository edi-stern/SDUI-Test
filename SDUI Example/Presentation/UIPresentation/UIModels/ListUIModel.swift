//
//  ListUIModel.swift
//  SDUI Example
//
//  Created by Eduard Stern on 28.11.2023.
//

import Foundation

struct ListUIModel: Decodable {
    let rows: [RowUIModel]
    let action: Action
}

struct RowUIModel: Decodable, Identifiable, Hashable {
    let id = UUID()
    let objectId: Int
    let imageUrl: URL
    let title: String
    let subTitle: String?
    let description: String?
    
    private enum CodingKeys: String, CodingKey {
        case objectId = "id"
        case title
        case subTitle
        case imageUrl
        case description
    }
}
