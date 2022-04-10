//
//  SearchSeriesFactory.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import SwiftUI

final class SearchSeriesFactory {
    func build() -> some View {
        let searchSeriesService = SearchSeriesService()
        let searchSeriesViewModel = SearchSeriesViewModel(service: searchSeriesService)
        let searchSeriesView = SearchSeriesView(viewModel: searchSeriesViewModel)
        
        return searchSeriesView
    }
}
