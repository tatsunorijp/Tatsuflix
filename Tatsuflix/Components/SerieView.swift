//
//  SerieView.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import SwiftUI

struct SerieView: View {
    // would be a good idea put all number inside of
    // a enum of constants - but no time man :( ....
    let serie: SerieResponse
    
    var body: some View {
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 8) {
                    Text(serie.name)
                        .font(.largeTitle.weight(.bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(L10n.SerieView.stars(serie.rating.average ?? 0.0))
                        .font(.footnote.weight(.semibold))
                    
                    Text(L10n.SerieView.status(serie.status))
                        .font(.footnote)
                }
                .padding(16)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .blur(radius: 30)
                )
            }
            .foregroundColor(.white)
            .background(
                AsyncImage(url: URL(string: serie.image?.original ?? ""), content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }, placeholder: {
                    ProgressView()
                })
            )
            .background(Color.gray)
            .mask(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
            )
            .frame(height: 300)
            .padding(16)
    }
}

struct SerieView_Previews: PreviewProvider {
    static var previews: some View {
        SerieView(serie: SerieResponse(
            id: 1,
            url: "",
            name: "Serie name",
            status: "status",
            genres: ["genr1", "genr2"],
            summary: "this movie is about...",
            image: SerieImageResponse(
                medium: "",
                original: ""
            ),
            schedule: SerieScheduleResponse(time: "", days: ["monday", "saturday"]),
            rating: SerieRatingResponse(average: 2.0)
        ))
    }
}
