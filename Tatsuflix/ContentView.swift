//
//  ContentView.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @Environment(\.showTabBar) var showTabBar
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .home:
                    HomeFactory().build()
                case .explore:
                    SearchSeriesFactory().build()
                case .favorite:
                    FavoritedSeriesFactory().build()
                case .configs:
                    SettingsFactory().build()
                }
            }
            
            if showTabBar {
                TabBar()
            }
        }
        .safeAreaInset(edge: .bottom) {
            // would be a good idea put all numbers inside of
            // a enum of constants - but no time man :( ....
            Color.clear.frame(height: 44)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
