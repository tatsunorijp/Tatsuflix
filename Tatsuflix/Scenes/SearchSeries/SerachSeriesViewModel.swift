//
//  SerachSeriesViewModel.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import SwiftUI
import Combine

class SearchSeriesViewModel: ObservableObject {
    private var cancellableBag = Set<AnyCancellable>()

    @Published var foundedSeries: [SerieResponse] = []
    @Published var isLoading = false
    @Published var error = false
    
    let service: SearchSeriesServicing
    
    init(service: SearchSeriesServicing) {
        self.service = service
    }
    
    func searchSeries(searchQuery: String) {
        if Validations.validateSearchQuery(searchQuery) {
            isLoading = true
            service.searchSeries(with: searchQuery) { [weak self] result in
                guard let self = self else { return }
                self.isLoading = false
                switch result {
                case .success(let series):
                    self.foundedSeries = series.map { $0.show }
                case .failure:
                    self.error = true
                }
            }
        }
    }
}
