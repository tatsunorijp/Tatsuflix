//
//  EpisodesList.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import SwiftUI

struct EpisodesListView: View {
    @Binding var isPresenting: Bool
    @StateObject var viewModel: EpisodesListViewModel
    
    var body: some View {
        BaseView(content: {
            NavigationView {
                List(viewModel.seasons) { season in
                    Text(L10n.EpisodeListView.season(season.seasonNumber))
                            .font(.title.weight(.semibold))
                            .padding(.top, 16)
                        ForEach(season.episodes) { episode in
                            EpisodeView(episode: episode)
                        }
                        .listRowSeparator(.hidden)
                }
                .listRowSeparator(.hidden)
                .navigationTitle(Text(L10n.EpisodeListView.title))
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(.plain)
                .onAppear {
                    viewModel.fetchEpisodes()
                }
            }
        }, isLoading: $viewModel.isLoading, showGenericError: $viewModel.error)
    }
}

struct EpisodesList_Previews: PreviewProvider {
    private static var viewModel: EpisodesListViewModel = {
        let service = EpisodesListServiceSpy()
        service.expectedResult = .success(EpisodeResponse.mock)
        
        let viewModel = EpisodesListViewModel(service: service, episodeId: 0)
        return viewModel
    }()
    
    static var previews: some View {
        EpisodesListView(
            isPresenting: .constant(true),
            viewModel: viewModel
        )
    }
}
