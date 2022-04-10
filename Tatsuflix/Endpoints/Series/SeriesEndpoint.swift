//
//  MoviesEndpoint.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import Foundation

struct SeriesEndpoint: DataRequest {
    typealias Response = [SerieResponse]
    
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
}
