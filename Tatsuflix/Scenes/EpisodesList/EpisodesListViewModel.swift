//
//  EpisodesListViewModel.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import Foundation

final class EpisodesListViewModel: ObservableObject {
    @Published var seasons: [SerieSeason] = []
    @Published var isLoading = false
    @Published var error = false
    
    private let service: EpisodesListServicing
    private let episodeId: Int
    
    init(service: EpisodesListServicing, episodeId: Int) {
        self.service = service
        self.episodeId = episodeId
    }
    
    func fetchEpisodes() {
        isLoading = true
        service.fetchEpisodes(of: episodeId) { [weak self] result in
            guard let self = self else { return }
            self.isLoading = false
            
            switch result {
            case .success(let episodes):
                self.separateInSeason(episodes: episodes)
            case .failure:
                self.error = true
            }
        }
    }
    
    private func separateInSeason(episodes: [EpisodeResponse]) {
        let numberOfSeason = episodes.last?.season ?? 0
        for i in 1...numberOfSeason {
            self.seasons.insert(
                SerieSeason(
                    id: i,
                    seasonNumber: i,
                    episodes: episodes.filter { $0.season == i }),
                at: self.seasons.count)
        }
    }
}

extension EpisodesListViewModel {
    struct SerieSeason: Identifiable, Equatable {
        let id: Int
        let seasonNumber: Int
        let episodes: [EpisodeResponse]
    }
}
