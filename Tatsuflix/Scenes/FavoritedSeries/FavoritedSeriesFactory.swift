//
//  FavoritedSeriesFactory.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import SwiftUI

final class FavoritedSeriesFactory {
    func build() -> some View {
        let favoritedSeriesService = FavoritedSeriesService()
        let favoritedSeriesViewModel = FavoritedSeriesViewModel(service: favoritedSeriesService)
        let favoritedSeriesView = FavoritedSeriesView(viewModel: favoritedSeriesViewModel)
        
        return favoritedSeriesView
    }
}
