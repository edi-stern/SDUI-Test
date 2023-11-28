//
//  TextRowComponent.swift
//  SDUI Example
//
//  Created by Eduard Stern on 28.11.2023.
//

import Foundation
import SwiftUI

struct TextRowComponent: UIComponent {
    
    let id: UUID = UUID()
    let uiModel: TextRowUIModel
    
    func render() -> AnyView {
        Text(uiModel.text)
            .anyView
    }
}
