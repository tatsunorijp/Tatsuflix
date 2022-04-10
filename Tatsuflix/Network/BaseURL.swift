//
//  BaseURL.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import Foundation

class BaseURL {
    private init() {}
    
    static func getBaseURL() -> String {
        // create if's to change base url when is in prod/dev/qa/etc
        return "https://api.tvmaze.com/"
    }
}
