//
//  ShowTabBar.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import SwiftUI

private struct ShowTabBar: EnvironmentKey {
    static let defaultValue = true
}

extension EnvironmentValues {
    var showTabBar: Bool {
        get { self[ShowTabBar.self] }
        set { self[ShowTabBar.self] = newValue }
    }
}

extension View {
    func showTabBar(_ value: Bool) -> some View {
        environment(\.showTabBar, value)
    }
}
