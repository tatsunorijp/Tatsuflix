//
//  HomeFactory.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import Foundation
import SwiftUI

class HomeFactory {
    func build() -> some View {
        let homeService = HomeService()
        let homeViewModel = HomeViewModel(service: homeService)
        let homeView = HomeView(viewModel: homeViewModel)
        
        return homeView
    }
}
