//
//  EpisodesEndpoint.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import Foundation

struct EpisodesEndpoint: DataRequest {
    let episodeId: Int
    
    var url: String {
        let baseURL = BaseURL.getBaseURL()
        let path: String = "shows/\(episodeId)/episodes"
        return baseURL + path
    }
    
    var queryItems: [String: String] {
        [:]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    func decode(_ data: Data) throws -> [EpisodeResponse] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let response = try decoder.decode([EpisodeResponse].self, from: data)
        return response
    }
}
