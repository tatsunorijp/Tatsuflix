//
//  EpisodesListViewModelTests.swift
//  TatsuflixTests
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import XCTest
@testable import Tatsuflix

final class EpisodesListServiceSpy: EpisodesListServicing {
    var expectedResult: Result<[EpisodeResponse], ApiError>!
    
    func fetchEpisodes(of serie: Int, completion: @escaping (Result<[EpisodeResponse], ApiError>) -> Void) {
        completion(expectedResult)
    }
}

final class EpisodesListViewModelTests: XCTestCase {
    private let serviceSpy = EpisodesListServiceSpy()
    private lazy var sut: EpisodesListViewModel = {
        let viewModel = EpisodesListViewModel(service: serviceSpy, episodeId: 0)
        
        return viewModel
    }()
    
    func testFetchEpisodes_ShouldReturnExpectedSeasons() {
        serviceSpy.expectedResult = .success(EpisodeResponse.mock)
        sut.fetchEpisodes()
        
        XCTAssertEqual(sut.seasons, [
            EpisodesListViewModel.SerieSeason(
                id: 1,
                seasonNumber: 1,
                episodes: [
                    EpisodeResponse.mock[0]
                ]),
            EpisodesListViewModel.SerieSeason(
                id: 2,
                seasonNumber: 2,
                episodes: [
                    EpisodeResponse.mock[1]
                ])
        ])
    }
}
