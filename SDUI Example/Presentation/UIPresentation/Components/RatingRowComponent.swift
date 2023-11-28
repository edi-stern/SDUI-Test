//
//  RatingRowComponent.swift
//  SDUI Example
//
//  Created by Eduard Stern on 28.11.2023.
//

import Foundation
import SwiftUI

struct RatingRowComponent: UIComponent {
    
    var id: UUID = UUID()
    let uiModel: RatingRowUIModel
    
    func render() -> AnyView {
        RatingView(rating: uiModel.rating)
            .padding(16)
            .anyView
    }
}

struct RatingView: View {
    let rating: Int

    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { number in
                Image(systemName: number <= rating ? "star.fill" : "star")
                    .foregroundColor(number <= rating ? .yellow : .gray)
            }
        }
    }
}
