//
//  ScreenModel.swift
//  SDUI Example
//
//  Created by Eduard Stern on 28.11.2023.
//

import Foundation

struct ScreenModel: Decodable {
    let pageTitle: String
    let backgroundColor: String?
    let components: [ComponentModel]
}

struct ComponentModel: Decodable {
    let type: ComponentType
    let data: [String: Any]
    
    private enum CodingKeys: CodingKey {
        case type
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(ComponentType.self, forKey: .type)
        self.data = try container.decode(JSON.self, forKey: .data).value as! [String : Any]
    }
}

enum ComponentType: String, Decodable {
    case featuredImage
    case carousel
    case textRow
    case ratingRow
    case list
}

enum ComponentError: Error {
    case decodingError
}
        
extension ScreenModel {
    func buildComponents() throws -> [UIComponent] {
        var components: [UIComponent] = []
        
        for component in self.components {
            switch component.type {
            case .featuredImage:
                guard let uiModel: FeaturedImageUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                
                components.append(ImageFeature(uiModel: uiModel))
            case .carousel:
                guard let uiModel: CarouselUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                
                components.append(CarouselComponent(uiModel: uiModel))
            case .textRow:
                guard let uiModel: TextRowUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                components.append(TextRowComponent(uiModel: uiModel))
            case .ratingRow:
                guard let uiModel: RatingRowUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                components.append(RatingRowComponent(uiModel: uiModel))
            case .list:
                guard let uiModel: ListUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                components.append(ListComponent(uiModel: uiModel))
            }
        }
        return components
    }
}
