//
//  LocalService.swift
//  SDUI Example
//
//  Created by Eduard Stern on 28.11.2023.
//

import Foundation

final class LocalService: NetworkService {
    func load(resource: String) async throws -> ScreenModel {
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            fatalError("Resource file indicated by \(resource) not found")
        }
        
        let data = try Data(contentsOf: URL(filePath: path))
        let screenModel = try JSONDecoder().decode(ScreenModel.self, from: data)
        
        return screenModel
    }
}
