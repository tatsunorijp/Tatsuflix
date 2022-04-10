//
//  FavoritedSeriesService.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import Foundation

protocol FavoritedSeriesServicing {
    func fetchSerie(serieId: Int, completion: @escaping (Result<SerieResponse, ApiError>) -> Void)
}

final class FavoritedSeriesService: FavoritedSeriesServicing {
    let service: Servicing
    
    init(service: Servicing = Service()) {
        self.service = service
    }
    
    func fetchSerie(serieId: Int, completion: @escaping (Result<SerieResponse, ApiError>) -> Void) {
        let request = SingleSearchSerieEndpoint(serieId: serieId)
        
        service.request(request) { result in
            DispatchQueue.main.sync {
                completion(result)
            }
        }
    }
}
