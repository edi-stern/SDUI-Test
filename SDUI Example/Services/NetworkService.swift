//
//  NetworkService.swift
//  SDUI Example
//
//  Created by Eduard Stern on 28.11.2023.
//

import Foundation


protocol NetworkService {
    func load(resource: String) async throws -> ScreenModel
}
