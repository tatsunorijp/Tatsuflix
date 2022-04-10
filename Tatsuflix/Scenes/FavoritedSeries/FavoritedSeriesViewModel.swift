//
//  FavoritedSeriesViewModel.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import SwiftUI

final class FavoritedSeriesViewModel: ObservableObject {
    let service: FavoritedSeriesServicing
    @Published var favoriteSeries: [SeriesEndpoint] = []
    
    init(service: FavoritedSeriesServicing) {
        self.service = service
    }
    
    func fetchFavoriteSeries() {
        
    }
}
