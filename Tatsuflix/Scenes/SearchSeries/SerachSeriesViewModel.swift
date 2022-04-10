//
//  SerachSeriesViewModel.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import SwiftUI

class SearchSeriesViewModel: ObservableObject {
    let service: SearchSeriesServicing
    @Published var foundedSeries: [SerieResponse] = []
    
    init(service: SearchSeriesServicing) {
        self.service = service
    }
    
    func searchSeries(searchQuery: String) {
        if Validations.validateSearchQuery(searchQuery) {
            service.searchSeries(with: searchQuery) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let series):
                    self.foundedSeries = series.map { $0.show }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
