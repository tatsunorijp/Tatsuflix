//
//  Validations.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import Foundation

final class Validations {
    private init() {}
    
    static func validateSearchQuery(_ query: String) -> Bool {
        return query.count >= 2
    }
}
