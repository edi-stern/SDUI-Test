//
//  DetailsView.swift
//  SDUI Example
//
//  Created by Eduard Stern on 28.11.2023.
//

import SwiftUI

struct DetailsView: View {
    
    @ObservedObject
    private var viewModel: DetailsViewModel
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.components, id: \.id) { component in
                    component.render()
                }
                Spacer()
            }.onAppear {
                Task {
                    await viewModel.load()
                }
            }
            .background(Color(hex: viewModel.screenModel.backgroundColor ?? "#ffffff"))
            .navigationTitle(viewModel.screenModel.pageTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    DetailsView(viewModel: .init(service: LocalService(), objectId: 0))
}
