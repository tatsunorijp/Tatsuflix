//
//  SearchSeriesView.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import SwiftUI

struct SearchSeriesView: View {
    @StateObject var viewModel: SearchSeriesViewModel
    @State var searchQuery = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.foundedSeries) { serie in
                        NavigationLink(destination: SerieDetailsFactory().build(serie: serie)) {
                            SerieView(serie: serie)
                        }
                        .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .padding(.bottom, 32)
            }
            .searchable(text: $searchQuery, prompt: "Series")
            .onSubmit(of: .search, {
                viewModel.searchSeries(searchQuery: searchQuery)
            })
            .preferredColorScheme(.dark)
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Search")
        }
    }
}

struct SearchSeriesView_Previews: PreviewProvider {
    private static var viewModel: SearchSeriesViewModel = {
        let service = SearchSeriesServiceSpy()
        service.expectedResult = .success(SearchSeriesResponse.mock)
        let viewModel = SearchSeriesViewModel(service: service)
        
        return viewModel
    }()
    
    static var previews: some View {
        SearchSeriesView(viewModel: viewModel)
    }
}
