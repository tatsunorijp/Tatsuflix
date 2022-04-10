//
//  HomeViewModel.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var series: [SerieResponse] = []
    @Published var seriesIsFull = false
    @Published var isLoading = false
    @Published var error = false
    
    private let service: HomeServicing
    var currentPage = 0
    
    init(service: HomeServicing) {
        self.service = service
    }
    
    func getSeries() {
        isLoading = true
        service.fetchSeries(inPage: currentPage) { [weak self] result in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let series):
                self.series.append(contentsOf: series)
                print(self.series.count)
                self.currentPage += 1
            case .failure(let error):
                if error == .notFound {
                    self.seriesIsFull = true
                }
                self.error = true
            }
        }
    }
}
