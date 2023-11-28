//
//  RowComponent.swift
//  SDUI Example
//
//  Created by Eduard Stern on 28.11.2023.
//

import Foundation
import SwiftUI

struct RowComponent: UIComponent {
    
    let id = UUID()
    let uiModel: RowUIModel
    
    func render() -> AnyView {
        HStack {
            AsyncImage(url: uiModel.imageUrl) { image in
                image.resizable()
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
            }
            .anyView
            
            VStack(alignment: .leading, spacing: 4) {
                Text(uiModel.title)
                    .foregroundColor(.primary)
                if let subTitle = uiModel.subTitle {
                    Text(subTitle)
                        .fontWeight(.light)
                }
                if let description = uiModel.description {
                    Text(description)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                }
            }
            .multilineTextAlignment(.leading)
            
            Spacer()
        }.padding()
            .anyView
    }
}
