//
//  test_swiftuiApp.swift
//  test.swiftui
//

import SwiftUI

@main
struct test_swiftuiApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel(isLocked: false))
        }
    }
}

