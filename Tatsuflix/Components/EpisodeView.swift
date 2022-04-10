//
//  EpisodesView.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import SwiftUI

struct EpisodeView: View {
    // would be a good idea put all number inside of
    // a enum of constants - but no time man :( ....
    let episode: EpisodeResponse
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: episode.image?.medium ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 140)
                    .mask(
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                    )
            } placeholder: {
                ProgressView()
                    .frame(width: 70, height: 130)
            }
            VStack(spacing: 4) {
                Group {
                    Text(L10n.EpisodeView.title(episode.number, episode.name))
                        .font(.footnote.weight(.semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(episode.summary?.removeHTMLTags() ?? "")
                        .font(.footnote)
                }
            }
        }
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView(episode: EpisodeResponse(
            id: 1,
            name: "Episode",
            number: 1,
            season: 1,
            summary: "In this episodes something incredible happens, but, you need to watch to see what will happens",
            image: EpisodeImage(
                medium: "",
                original: ""
            )
        ))
    }
}
