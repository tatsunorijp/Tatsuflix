//
//  SettingsViewModel.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    @Published var isAuthenticationEnabled: Bool
    
    init(isAuthenticationEnabled: Bool = UserDefaultsHelper.isAuthenticationEnabled()) {
        self.isAuthenticationEnabled = isAuthenticationEnabled
    }
    
    func setAuthenticationFor(_ isEnabled: Bool) {
        UserDefaultsHelper.setAuthentication(value: isEnabled)
    }
}
