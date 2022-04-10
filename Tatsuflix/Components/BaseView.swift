//
//  LoadingView.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import SwiftUI

struct BaseView<Content: View>: View {
    @Binding var isLoading: Bool
    @Binding var showGenericError: Bool
    let content: Content
    
    init(
        @ViewBuilder content: () -> Content,
        isLoading: Binding<Bool>,
        showGenericError: Binding<Bool>) {
            self.content = content()
            self._isLoading = isLoading
            self._showGenericError = showGenericError
        }
    
    var body: some View {
        ZStack {
            content
            if isLoading {
                VisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterialDark))
                    .edgesIgnoringSafeArea(.all)
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .scaleEffect(1.5)
                    .transition(.opacity)
            }
        }
        .alert(L10n.GenericError.title, isPresented: $showGenericError) {
            Button(L10n.GenericError.ok, role: .cancel) { }
        } message: {
            Text(L10n.GenericError.body)
        }
        
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView(content: {
            VStack(alignment: .center, spacing: 25) {
                HStack {
                    Image("iosAppTemplates-logo-icon")
                }
                .padding(.top, 60)
                Text("iOS App Templates")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        },
                    isLoading: .constant(false),
                    showGenericError: .constant(false)
        )
    }
}
