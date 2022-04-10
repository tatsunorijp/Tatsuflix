//
//  HomeService.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import Foundation

protocol HomeServicing: AnyObject {
    func fetchSeries(inPage: Int, completion: @escaping (Result<[SerieResponse], ApiError>) -> Void)
}

final class HomeService: HomeServicing {
    private let service: Servicing
    
    init(service: Servicing = Service()) {
        self.service = service
    }
    
    func fetchSeries(inPage: Int, completion: @escaping (Result<[SerieResponse], ApiError>) -> Void) {
        let request = SeriesEndpoint(page: inPage)
        service.request(request) { result in
            DispatchQueue.main.sync {
                completion(result)
            }
        }
    }
}
