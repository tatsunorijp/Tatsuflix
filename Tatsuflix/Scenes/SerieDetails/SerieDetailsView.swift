//
//  SerieDetails.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import SwiftUI

struct SerieDetailsView: View {
    // would be a good idea put all number inside of
    // a enum of constants - but no time man :( ....
    @State var isPresenting = false
    @State var isFavorited = false
    @StateObject var viewModel: SerieDetailsViewModel
    
    var body: some View {
        ZStack {
            ScrollView {
                imageHeader
                    .overlay(serieDetails)
                    .padding(.bottom, 250)
            }
        }
        .navigationTitle(Text(L10n.SerieDetails.title))
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var imageHeader: some View {
        AsyncImage(url: URL(string: viewModel.serie.image?.original ?? "")) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: 500)
                .foregroundColor(.black)
                .mask(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                )
        } placeholder: {
            ProgressView()
                .frame(maxWidth: .infinity, minHeight: 500)
        }
    }
    
    var serieDetails: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(viewModel.serie.name)
                    .font(.largeTitle.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Button {
                    isFavorited.toggle()
                } label: {
                    Group {
                        isFavorited
                        ? Image(systemName: "star.fill")
                        : Image(systemName: "star")
                    }
                    .foregroundColor(.yellow)
                }
            }
            
            Text(viewModel.serie.summary.removeHTMLTags())
                .font(.footnote)
            
            Divider()
            content
            Divider()
            HStack {
                Button {
                    isPresenting = true
                } label: {
                    Text(L10n.SerieDetails.episodes)
                }
                .sheet(isPresented: $isPresenting) {
                    EpisodesListFactory().build(
                        isPresented: $isPresenting,
                        episodeId: viewModel.serie.id
                    )
                }
                Spacer()
            }
        }
        .padding(24)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        )
        .offset(y: 224)
        .padding(16)
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(spacing: 4) {
                Text(L10n.SerieDetails.genres)
                    .font(.title3.weight(.semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    ForEach(viewModel.serie.genres, id: \.self) { gender in
                        Text(gender)
                            .font(.footnote)
                    }
                    Spacer()
                }
            }
            VStack(spacing: 4) {
                Text(L10n.SerieDetails.releaseDays)
                    .font(.title3.weight(.semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    ForEach(viewModel.serie.schedule.days, id: \.self) { day in
                        Text(day)
                            .font(.footnote)
                    }
                    Spacer()
                }
            }
            Text(L10n.SerieDetails.exhibitionTime(viewModel.serie.schedule.time))
                .font(.title3.weight(.semibold))
        }
    }
    
    var test: some View {
        EpisodesListFactory().build(isPresented: .constant(false), episodeId: viewModel.serie.id)
    }
}

struct SerieDetails_Previews: PreviewProvider {
    static var previews: some View {
        SerieDetailsView(viewModel: SerieDetailsViewModel(
            service: SerieDetailsService(),
            serie: SerieResponse(
                id: 1,
                url: "",
                name: "Name",
                status: "Status",
                genres: ["gender"],
                summary: "summary",
                image: nil,
                schedule: SerieScheduleResponse(time: "", days: ["segunda"]),
                rating: SerieRatingResponse(average: 20.0)
            )
        ))
    }
}
