//
//  EpisodesListService.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import Foundation

protocol EpisodesListServicing: AnyObject {
    func fetchEpisodes(of serie: Int, completion: @escaping (Result<[EpisodeResponse], ApiError>) -> Void)
}

final class EpisodesListService: EpisodesListServicing {
    private let service: Servicing
    
    init(service: Servicing = Service()) {
        self.service = service
    }
    
    func fetchEpisodes(of serieId: Int, completion: @escaping (Result<[EpisodeResponse], ApiError>) -> Void) {
        let request = EpisodesEndpoint(episodeId: serieId)
        service.request(request) { result in
            DispatchQueue.main.sync {
                completion(result)
            }
        }
    }
    
}
