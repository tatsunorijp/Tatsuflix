//
//  SettingsFactory.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import Foundation
import SwiftUI

final class SettingsFactory {
    func build() -> some View {
        let settingsViewModel = SettingsViewModel()
        let settingsView = SettingsView(viewModel: settingsViewModel)
        
        return settingsView
    }
}
