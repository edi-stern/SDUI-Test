//
//  CarouselUIModel.swift
//  SDUI Example
//
//  Created by Eduard Stern on 28.11.2023.
//

import Foundation

struct CarouselUIModel: Decodable {
    let items: [CarouselUIRowModel]
    let action: Action
}

struct CarouselUIRowModel: Decodable, Identifiable, Hashable {
    let id = UUID()
    let objectId: Int
    let imageUrl: URL
    
    private enum CodingKeys: String, CodingKey {
        case objectId
        case imageUrl
    }
}
