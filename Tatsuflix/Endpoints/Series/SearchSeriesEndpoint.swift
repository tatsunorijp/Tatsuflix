//
//  SearchSeries.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import Foundation

struct SearchSeriesEndpoint: DataRequest {
    typealias Response = [SearchSeriesResponse]
    
    let searchQuery: String
    
    var url: String {
        let baseURL = BaseURL.getBaseURL()
        let path: String = "search/shows"
        
        return baseURL + path
    }
    
    var queryItems: [String: String] {
        ["q": searchQuery]
    }
    
    var method: HTTPMethod { .get }
}
