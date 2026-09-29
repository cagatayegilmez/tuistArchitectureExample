//
//  Button+Previews.swift
//  Components
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import DesignSystem
import SwiftUI

#Preview("Primary") {
    VStack(spacing: 14) {
        Spacer()
        ExampleButton(configuration: .primary(title: "Sign In")) {
            print("sign in tapped")
        }

        ExampleButton(configuration: .primary(title: "Sign In (disabled)")) {}
            .disabled(true)
        Spacer()
    }
    .padding(32)
    .background(ExampleColor.background)
}

#Preview("Plain") {
    ExampleButton(configuration: .plain(title: "Logout")) {
        print("logout tapped")
    }
    .padding(32)
    .background(ExampleColor.background)
}

#Preview("Login Form") {
    struct LoginPreview: View {
        @State private var email = ""
        @State private var password = ""

        var body: some View {
            VStack(spacing: 14) {
                Spacer()
                ExampleTextInput(text: $email, configuration: .email())
                ExampleTextInput(text: $password, configuration: .password())
                ExampleButton(configuration: .primary(title: "Sign In")) {
                    print("sign in: \(email)")
                }
                Spacer()
            }
            .padding(32)
            .background(ExampleColor.background)
        }
    }
    return LoginPreview()
}
