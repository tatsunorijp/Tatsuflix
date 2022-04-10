//
//  SerieDetailsFactory.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import Foundation
import SwiftUI

final class SerieDetailsFactory {
    func build(serie: SerieResponse) -> some View {
        let serieDetailsService = SerieDetailsService()
        let serieDetailsViewModel = SerieDetailsViewModel(service: serieDetailsService, serie: serie)
        let serieDetailsView = SerieDetailsView(viewModel: serieDetailsViewModel)
        
        return serieDetailsView
    }
}
