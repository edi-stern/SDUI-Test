//
//  CarouselComponent.swift
//  SDUI Example
//
//  Created by Eduard Stern on 28.11.2023.
//

import Foundation
import SwiftUI

struct CarouselComponent: UIComponent {
    
    let uiModel: CarouselUIModel
    let id: UUID = UUID()
    
    func render() -> AnyView {
        CarouselView(uiModel: uiModel).anyView
    }
}

