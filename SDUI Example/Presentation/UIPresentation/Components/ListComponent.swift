//
//  ListComponent.swift
//  SDUI Example
//
//  Created by Eduard Stern on 28.11.2023.
//

import Foundation
import SwiftUI

struct ListComponent: UIComponent {
    
    let uiModel: ListUIModel
    let id: UUID = UUID()
    
    @MainActor
    func render() -> AnyView {
        ForEach(uiModel.rows, id: \.id) { row in
            Navigator.perform(action: uiModel.action, payload: row) {
                RowComponent(uiModel: row).render().anyView
            }
        }
        .anyView
    }
}

