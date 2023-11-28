//
//  ContentView.swift
//  SDUI Example
//
//  Created by Eduard Stern on 28.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject
    private var viewModel: ListViewModel
    
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.components, id: \.id) { component in
                    component.render()
                }
                .navigationTitle(viewModel.screenModel.pageTitle)
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
    ContentView(viewModel: ListViewModel(service: LocalService()))
}

