//
//  SerieEpisodes.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import Foundation

struct EpisodeResponse: Decodable, Identifiable, Equatable {
    let id: Int
    let name: String
    let number: Int
    let season: Int
    let summary: String?
    let image: EpisodeImage?
}

struct EpisodeImage: Decodable, Equatable {
    let medium: String
    let original: String
}

// for testing purpose
extension EpisodeResponse {
    static let mock = [
        EpisodeResponse(
            id: 0,
            name: "",
            number: 1,
            season: 1,
            summary: nil,
            image: nil
        ),
        EpisodeResponse(
            id: 0,
            name: "",
            number: 1,
            season: 2,
            summary: nil,
            image: nil
        ),
    ]
}
