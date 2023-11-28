//
//  ListViewModel.swift
//  SDUI Example
//
//  Created by Eduard Stern on 28.11.2023.
//

import Foundation

@MainActor
final class ListViewModel: ObservableObject {
    private var service: NetworkService
    
    @Published
    var components: [UIComponent] = []
    var screenModel: ScreenModel = ScreenModel(pageTitle: "", backgroundColor: "", components: [])
    
    init(service: NetworkService) {
        self.service = service
    }
    
    public func load() async {
        do {
            screenModel = try await service.load(resource: Constants.listings)
            components = try screenModel.buildComponents()
        } catch {
            print(error)
        }
    }
}
