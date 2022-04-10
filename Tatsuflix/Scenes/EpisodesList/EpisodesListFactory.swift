//
//  EpisodesListFactory.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import Foundation
import SwiftUI

final class EpisodesListFactory {
    func build(isPresented: Binding<Bool>, episodeId: Int) -> some View {
        let episodeListService = EpisodesListService()
        let episodeListViewModel = EpisodesListViewModel(service: episodeListService, episodeId: episodeId)
        let episodeListView = EpisodesListView(isPresenting: isPresented, viewModel: episodeListViewModel)
        
        return episodeListView
    }
}
