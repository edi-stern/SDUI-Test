//
//  DetailsViewModel.swift
//  SDUI Example
//
//  Created by Eduard Stern on 28.11.2023.
//

import Foundation

@MainActor
final class DetailsViewModel: ObservableObject {
    private var service: NetworkService
    private var objectId: Int
    
    @Published
    var components: [UIComponent] = []
    var screenModel: ScreenModel = ScreenModel(pageTitle: "", backgroundColor: "", components: [])
    
    init(service: NetworkService, objectId: Int) {
        self.service = service
        self.objectId = objectId
    }
    
    public func load() async {
        do {
            screenModel = try await service.load(resource: Constants.getDetails(id: objectId))
            components = try screenModel.buildComponents()
        } catch {
            print(error)
        }
    }
}
