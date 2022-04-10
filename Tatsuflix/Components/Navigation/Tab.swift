//
//  Tab.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    let text: String
    let icon: String
    let tab: Tab
    let color: Color
}

let tabItems = [
    TabItem(text: "Home", icon: "house", tab: .home, color: .teal),
    TabItem(text: "Search", icon: "magnifyingglass", tab: .explore, color: .blue),
    TabItem(text: "Settings", icon: "gearshape", tab: .configs, color: .red),
]

enum Tab: String {
    case home
    case explore
    case configs
}
