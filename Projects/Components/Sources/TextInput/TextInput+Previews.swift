//
//  TextInput+Previews.swift
//  Components
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import DesignSystem
import SwiftUI

private struct ExampleTextInputPreviewHost: View {
    @State private var text = ""
    @State private var error: String?
    @State private var lastCallback = "—"
    let configuration: ExampleTextInputConfiguration
    let errorMessage: String?

    init(configuration: ExampleTextInputConfiguration,
         errorMessage: String? = nil) {
        self.configuration = configuration
        self.errorMessage = errorMessage
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            ExampleTextInput(text: $text,
                             error: $error,
                             configuration: configuration)
            .onTextChanged {
                lastCallback = $0
            }

            Text("Binding: \"\(text)\"")
                .font(.textCaption)
                .foregroundStyle(ExampleColor.textPrimary)
            Text("onTextChanged: \"\(lastCallback)\"")
                .font(.textCaption)
                .foregroundStyle(ExampleColor.textPrimary)
            Text("error: \"\(error ?? "nil")\"")
                .font(.textCaption)
                .foregroundStyle(ExampleColor.textPrimary)

            if let errorMessage {
                Button("Trigger Error") {
                    error = errorMessage
                }
                .font(.textCaption)
            }
            Spacer()
        }
        .padding(32)
        .background(ExampleColor.background)
    }
}

#Preview("Text") {
    ExampleTextInputPreviewHost(configuration: .text(placeholder: "Name"))
}

#Preview("Email") {
    ExampleTextInputPreviewHost(configuration: .email())
}

#Preview("Email + Error") {
    ExampleTextInputPreviewHost(configuration: .email(),
                                errorMessage: "Please enter a valid e-mail address")
}

#Preview("Password") {
    ExampleTextInputPreviewHost(configuration: .password())
}

#Preview("Amount") {
    ExampleTextInputPreviewHost(configuration: .amount())
}

#Preview("Login Form") {
    struct LoginFormPreview: View {
        @State private var email = ""
        @State private var emailError: String?
        @State private var password = ""
        @State private var passwordError: String?

        var body: some View {
            VStack(spacing: 14) {
                Spacer()
                ExampleTextInput(text: $email,
                                 error: $emailError,
                                 configuration: .email())
                ExampleTextInput(text: $password,
                                 error: $passwordError,
                                 configuration: .password())
                Button("Validate") {
                    emailError = "Please enter a valid e-mail address"
                    passwordError = "Password must be at least 8 characters"
                }
                Spacer()
            }
            .padding(32)
            .background(ExampleColor.background)
        }
    }
    return LoginFormPreview()
}
