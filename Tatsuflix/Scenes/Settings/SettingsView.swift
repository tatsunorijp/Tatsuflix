//
//  SettingsView.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel: SettingsViewModel
    
    var body: some View {
        NavigationView {
            List {
                profile
                Section {
                    HStack {
                        Label(L10n.Settings.authentication, systemImage: "lock")
                        Toggle("", isOn: $viewModel.isAuthenticationEnabled)
                            .toggleStyle(SwitchToggleStyle(tint: .indigo))
                            .onReceive([self.viewModel.isAuthenticationEnabled].publisher.first()) { value in
                                print(value)
                                viewModel.setAuthenticationFor(value)
                            }
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 8)
                }
            }
            .listStyle(.insetGrouped)
            .preferredColorScheme(.dark)
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle(L10n.Settings.title)
        }
    }
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
                        .offset(x: -50, y: -100)
                )
                .background(
                    BlobView()
                        .offset(x: 200, y: 0)
                        .scaleEffect(0.6)
                )
            Text(L10n.Settings.tatsuflix)
                .font(.title.weight(.bold))
            HStack {
                Image(systemName: "brain.head.profile")
                    .imageScale(.small)
                Text(L10n.Settings.createdBy)
                    .foregroundColor(.secondary)
            }
            Text(L10n.Settings.me)
                .font(.body.weight(.bold))
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

// struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
// }
