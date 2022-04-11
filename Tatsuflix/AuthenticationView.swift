//
//  AuthenticationView.swift
//  Tatsuflix
//
//  Created by Wellington Tatsunori Asahide on 10/04/22.
//

import SwiftUI
import LocalAuthentication

struct AuthenticationView<Content: View>: View {
    @State private var isUnlocked = false
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        if UserDefaultsHelper.isAuthenticationEnabled() {
            if isUnlocked {
                content
            } else {
                VStack {
                    Text("Blocked")
                    Text("if you are in the simulator, go to:")
                    Text("Features -> FaceID -> Enrolled")
                        .foregroundColor(.blue)
                    Text("And to recognize, go to:")
                    Text("Features -> FaceID -> Mathing Face")
                }
                .onAppear(perform: authenticate)
            }
        } else {
            content
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, _ in
                if success {
                    isUnlocked = true
                } else {
                }
            }
        } else {
            // no biometrics
        }
    }
}

// struct AuthenticationView_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthenticationView()
//    }
// }
