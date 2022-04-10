//
//  MoviesResponse.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import Foundation

struct SerieResponse: Decodable, Identifiable, Equatable {
    let id: Int
    let url: String
    let name: String
    let status: String
    let genres: [String]
    let summary: String
    let image: SerieImageResponse?
    let schedule: SerieScheduleResponse
    let rating: SerieRatingResponse
}

struct SerieImageResponse: Decodable, Equatable {
    let medium: String
    let original: String
}

struct SerieRatingResponse: Decodable, Equatable {
    let average: Double?
}

struct SerieScheduleResponse: Decodable, Equatable {
    let time: String
    let days: [String]
}

// Testing purpose
extension SerieResponse {
    static let mock = [
        SerieResponse(
            id: 0,
            url: "",
            name: "0",
            status: "0",
            genres: [],
            summary: "0",
            image: nil,
            schedule: SerieScheduleResponse(time: "0", days: []),
            rating: SerieRatingResponse(average: nil)),
        SerieResponse(
            id: 1,
            url: "",
            name: "1",
            status: "1",
            genres: [],
            summary: "1",
            image: nil,
            schedule: SerieScheduleResponse(time: "1", days: []),
            rating: SerieRatingResponse(average: nil)),
    ]
}
