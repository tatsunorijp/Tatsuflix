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
    }
}

//struct EpisodesList_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodesListView(isPresenting: .constant(true), viewModel: EpisodesListViewModel(service: <#T##EpisodesListServicing#>, episodeId: <#T##Int#>))
//    }
//}
