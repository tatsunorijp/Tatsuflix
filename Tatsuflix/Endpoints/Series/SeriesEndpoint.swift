//
//  MoviesEndpoint.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import Foundation

struct SeriesEndpoint: DataRequest {
    let page: Int
    
    var url: String {
        let baseURL = BaseURL.getBaseURL()
        let path: String = "shows"
        return baseURL + path
    }
    
    var queryItems: [String: String] {
        [
            "page": "\(page)"
        ]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    func decode(_ data: Data) throws -> [SerieResponse] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let response = try decoder.decode([SerieResponse].self, from: data)
        return response
    }
}
