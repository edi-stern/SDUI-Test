//
//  SDUI_ExampleApp.swift
//  SDUI Example
//
//  Created by Eduard Stern on 28.11.2023.
//

import SwiftUI

@main
struct SDUI_ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ListViewModel(service: LocalService()))
        }
    }
}
