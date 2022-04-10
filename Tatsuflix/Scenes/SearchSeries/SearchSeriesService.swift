//
//  SearchSeriesService.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import Foundation

protocol SearchSeriesServicing {
    func searchSeries(with searchQuery: String, completion: @escaping (Result<[SearchSeriesResponse], ApiError>) -> Void)
}

final class SearchSeriesService: SearchSeriesServicing {
    private let service: Servicing
    
    init(service: Servicing = Service()) {
        self.service = service
    }
    
    func searchSeries(with searchQuery: String, completion: @escaping (Result<[SearchSeriesResponse], ApiError>) -> Void) {
        let request = SearchSeriesEndpoint(searchQuery: searchQuery)
        service.request(request) { result in
            DispatchQueue.main.sync {
                completion(result)
            }
        }
    }
}

final class SearchSeriesServiceSpy: SearchSeriesServicing {
    var expectedResult: Result<[SearchSeriesResponse], ApiError>!
    
    func searchSeries(with searchQuery: String, completion: @escaping (Result<[SearchSeriesResponse], ApiError>) -> Void) {
        completion(expectedResult)
    }
}
