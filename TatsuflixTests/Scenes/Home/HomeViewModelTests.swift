//
//  HomeViewModelTests.swift
//  TatsuflixTests
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import XCTest
import Combine
@testable import Tatsuflix

final class HomeViewModelTests: XCTestCase {
    private let serviceSpy = HomeServiceSpy()
    private lazy var sut: HomeViewModel = {
        let viewModel = HomeViewModel(service: serviceSpy)
        return viewModel
    }()
    private var cancellables: Set<AnyCancellable> = []
    
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
    
    func testGetSeries_WhenFailure_ErrorShouldToggle() {
        let expectation = XCTestExpectation(description: "State is set to populated")
        
        sut.$error.collect(2).sink { value in
            XCTAssertEqual(value, [false, true])
            expectation.fulfill()
        }
        .store(in: &cancellables)
        
        serviceSpy.expectedResult = .failure(.notFound)
        sut.getSeries()
        
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testGetSeries_IsLoadingShouldToggle() {
        let expectation = XCTestExpectation(description: "State is set to populated")
        
        sut.$isLoading.collect(3).sink { value in
            XCTAssertEqual(value, [false, true, false])
            expectation.fulfill()
        }
        .store(in: &cancellables)
        
        serviceSpy.expectedResult = .failure(.notFound)
        sut.getSeries()
        
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testGetSeries_WhenNotFoundError_SeriesIsFullShouldBeTrue() {
        serviceSpy.expectedResult = .failure(.notFound)
        XCTAssertFalse(sut.seriesIsFull)
        sut.getSeries()
        XCTAssertTrue(sut.seriesIsFull)
    }
}
