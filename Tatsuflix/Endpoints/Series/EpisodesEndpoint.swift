//
//  EpisodesEndpoint.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import Foundation

struct EpisodesEndpoint: DataRequest {
    typealias Response = [EpisodeResponse]
    
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
}
