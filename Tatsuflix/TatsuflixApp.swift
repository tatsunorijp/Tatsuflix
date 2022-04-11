//
//  TatsuflixApp.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 09/04/22.
//

import SwiftUI

@main
struct TatsuflixApp: App {
    var body: some Scene {
        WindowGroup {
            AuthenticationView {
                ContentView()
            }
        }
    }
}
