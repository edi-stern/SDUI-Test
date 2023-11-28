//
//  Constants.swift
//  SDUI Example
//
//  Created by Eduard Stern on 28.11.2023.
//

import Foundation

struct Constants {
    static let listings = "cities-listing"
    
    static func getDetails(id: Int) -> String {
        return "city-detail-\(id)"
    }
}
