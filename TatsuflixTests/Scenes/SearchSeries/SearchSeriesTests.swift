//
//  SearchSeriesTests.swift
//  TatsuflixTests
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import XCTest
@testable import Tatsuflix

final class SearchSeriesTests: XCTestCase {
    private let serviceSpy = SearchSeriesServiceSpy()
    private lazy var sut: SearchSeriesViewModel = {
        let viewModel = SearchSeriesViewModel(service: serviceSpy)
        
        return viewModel
    }()
    
    func testSearch_whenQueryIsBiggerThenTwo_shouldReturnSeries() {
        serviceSpy.expectedResult = .success(SearchSeriesResponse.mock)
        sut.searchSeries(searchQuery: "12")
        
        XCTAssertEqual(sut.foundedSeries, SerieResponse.mock)
    }
}
