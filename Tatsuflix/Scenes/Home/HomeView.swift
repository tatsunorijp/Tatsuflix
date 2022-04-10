//
//  ContentView.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import SwiftUI

struct HomeView: View {
    @State var hasScrolled = false
    @State private var viewDidLoad = false
    @StateObject var viewModel: HomeViewModel
    @Environment(\.showTabBar) var showTabBar
    
    var body: some View {
        BaseView(content: {
            NavigationView {
                List {
                    ForEach(viewModel.series) { serie in
                        NavigationLink(destination: SerieDetailsFactory().build(serie: serie)) {
                            SerieView(serie: serie)
                        }
                        .listRowSeparator(.hidden)
                    }
                    
                    if !viewModel.seriesIsFull {
                        ProgressView()
                            .onAppear {
                                viewModel.getSeries()
                            }
                            .frame(maxWidth: .infinity)
                    }
                }
                .listStyle(.plain)
                .preferredColorScheme(.dark)
                .navigationBarTitleDisplayMode(.large)
                .navigationTitle(Text(L10n.title))
            }
        },
                    isLoading: $viewModel.isLoading,
                    showGenericError: $viewModel.error)
        .environment(\.showTabBar, !viewModel.isLoading)
    }
}

struct Home_Previews: PreviewProvider {
    private static var viewModel: HomeViewModel = {
        let service = HomeServiceSpy()
        service.expectedResult = .success(SerieResponse.mock)
        
        let viewModel = HomeViewModel(service: service)
        return viewModel
    }()
    
    static var previews: some View {
        HomeView(viewModel: viewModel)
    }
}
