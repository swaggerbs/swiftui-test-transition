//
//  MainViewModel.swift
//  test.swiftui
//

import SwiftUI

final class MainViewModel: ObservableObject {
    @Published
    private(set) var isLocked: Bool
    
    init(isLocked: Bool) {
        self.isLocked = isLocked
    }
    
    func toggleLockedButton() {
        isLocked.toggle()
    }

}
