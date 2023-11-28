//
//  ImageFeature.swift
//  SDUI Example
//
//  Created by Eduard Stern on 28.11.2023.
//

import Foundation
import SwiftUI

struct ImageFeature: UIComponent {
    
    let uiModel: FeaturedImageUIModel
    let id: UUID = UUID()
    
    func render() -> AnyView {
        AsyncImage(url: uiModel.imageUrl) { image in
            image.resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            ProgressView()
        }.anyView
    }
}
