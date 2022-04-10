//
//  HomeViewModelTests.swift
//  TatsuflixTests
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import XCTest
@testable import Tatsuflix

final class HomeServiceSpy: HomeServicing {
    var expectedResult: Result<[SerieResponse], ApiError>!
    func fetchSeries(inPage: Int, completion: @escaping (Result<[SerieResponse], ApiError>) -> Void) {
        completion(expectedResult)
    }
}

final class HomeViewModelTests: XCTestCase {
    private let serviceSpy = HomeServiceSpy()
    private lazy var sut: HomeViewModel = {
        let viewModel = HomeViewModel(service: serviceSpy)
        return viewModel
    }()
    
    func testGetSeries_whenSucceed_seriesShouldContainSeries() {
        serviceSpy.expectedResult = .success(SerieResponse.mock)
        sut.getSeries()
        
        XCTAssertEqual(sut.series, [SerieResponse(id: 0,
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
                                        rating: SerieRatingResponse(average: nil))
        ])
    }
}
