//
//  SearchSeriesResponse.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import Foundation

struct SearchSeriesResponse: Decodable, Equatable {
    let score: Double
    let show: SerieResponse
}

extension SearchSeriesResponse {
    static let mock = [
        SearchSeriesResponse(
            score: 0.0,
            show: SerieResponse.mock[0]
        ),
        SearchSeriesResponse(
            score: 0.0,
            show: SerieResponse.mock[1]
        )
    ]
}
