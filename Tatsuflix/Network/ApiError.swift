//
//  ApiError.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import Foundation

enum ApiError: Error {
    case notFound
    case data
    case url
    case urlComponents
    case decoding
    case serverError
    case generic
}
