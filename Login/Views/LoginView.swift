//
//  LoginView.swift
//  Login
//
//  Created by Takayuki Sakamoto on 2026/03/16.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: AuthViewModel
    @State private var isLoading = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("ログイン")
                .font(.largeTitle)
                .bold()
            
            if isLoading {
                ProgressView()
            }
                
            TextField("メール", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                
            SecureField("パスワード", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button {
                isLoading = true
                
                // 擬似ローディング
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    viewModel.login()
                    isLoading = false
                }
                
            } label: {
                Text("ログイン")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(isLoading)
                
            // エラー表示
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
            }
            
        }
        .padding()
    }
}

/*
#Preview {
    LoginView()
}
*/
