//
//  SerieDetailsViewModel.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import Foundation

final class SerieDetailsViewModel: ObservableObject {
    @Published var episodesResult: [EpisodeResponse] = []
    let service: SerieDetailsServicing
    let serie: SerieResponse
    
    init(service: SerieDetailsServicing, serie: SerieResponse) {
        self.service = service
        self.serie = serie
    }
}
