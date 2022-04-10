//
//  SingleSearchSerieEndpoint.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import Foundation

struct SingleSearchSerieEndpoint: DataRequest {
    let serieId: Int
    
    var url: String {
        let baseURL = BaseURL.getBaseURL()
        let path: String = "search/shows/\(serieId)"
        
        return baseURL + path
    }
    
    var queryItems: [String: String] {
        [:]
    }
    
    var method: HTTPMethod { .get }
    
    func decode(_ data: Data) throws -> SerieResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let response = try decoder.decode(SerieResponse.self, from: data)
        return response
    }
}
