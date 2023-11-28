//
//  Navigator.swift
//  SDUI Example
//
//  Created by Eduard Stern on 28.11.2023.
//

import Foundation
import SwiftUI

struct SheetView<V: View>: View {
    @State private var isPresented: Bool = false
    let content: ()-> V
    let destinationView: AnyView
    
    var body: some View {
        content().onTapGesture {
            isPresented = true
        }.sheet(isPresented: $isPresented, content: {
            destinationView
        })
    }
}

final class Navigator {
    @MainActor 
    static func perform<V: View>(action: Action, payload: Any? = nil, content: @escaping () -> V) -> AnyView {
        
        var destinationView: AnyView!
        
        switch action.destination {
        case .details:
            if let payload = payload as? CarouselUIRowModel {
                let viewModel = DetailsViewModel(service: LocalService(), objectId: payload.objectId)
                destinationView = DetailsView(viewModel: viewModel).anyView
            } else if let payload = payload as? RowUIModel {
                let viewModel = DetailsViewModel(service: LocalService(), objectId: payload.objectId)
                destinationView = DetailsView(viewModel: viewModel).anyView
            } else {
                destinationView = Text("Detail").anyView
            }
        }
        
        switch action.type {
        case .sheet:
            return SheetView(content: {
                content()
            }, destinationView: destinationView)
            .anyView
        case .push:
            return NavigationLink {
                destinationView
            } label: {
                content()
            }.anyView
        }
    }
}
