//
//  UserDefaultHeper.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import Foundation

final class UserDefaultsHelper {
    private enum Keys: String {
        case series = "favoritedSeries"
        case faceId = "faceID"
    }
    
    private static let defaults = UserDefaults.standard
    
    private init () {}
    
    static func addFavoriteSerie(serieId: Int) {
        let newSeriesList = getFavoriteSeries() + [serieId]
        defaults.set([newSeriesList], forKey: Keys.series.rawValue)
    }
    
    static func getFavoriteSeries() -> [Int] {
        guard let seriesList = defaults.array(forKey: Keys.series.rawValue) as? [Int] else {
            return []
        }
        
        return seriesList
    }
    
    static func deleteFavoriteSerie(serieId: Int) {
        guard let seriesList = defaults.array(forKey: Keys.series.rawValue) as? [Int] else {
            return
        }
        
        let newSeriesList = seriesList.map { $0 != serieId }
        defaults.set([newSeriesList], forKey: Keys.series.rawValue)
    }
    
    static func setAuthentication(value: Bool) {
        defaults.set(value, forKey: Keys.faceId.rawValue)
    }
    
    static func isAuthenticationEnabled() -> Bool {
        defaults.bool(forKey: Keys.faceId.rawValue)
    }
}
