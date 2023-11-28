//
//  CarouselView.swift
//  SDUI Example
//
//  Created by Eduard Stern on 28.11.2023.
//

import SwiftUI

struct CarouselView: View {
    
    let uiModel: CarouselUIModel
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(uiModel.items, id: \.self) { item in
                    Navigator.perform(action: uiModel.action, payload: item) {
                        AsyncImage(url: item.imageUrl) { image in
                            image.resizable()
                                .frame(width: 200, height: 200)
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }.anyView
                    }
                }
            }
        }
    }
}

#Preview {
    CarouselView(uiModel: .init(items: [], action: .init(type: .sheet, destination: .details)))
}
