//
//  LoginView.swift
//  Login
//
//  Created by Takayuki Sakamoto on 2026/03/16.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var isLoggedIn: Bool
    
    @State private var username = ""
    @State private var password = ""
    @State private var loginFaild = false
    @State private var isLoading = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("ログイン")
                .font(.largeTitle)
                .bold()
            
            if isLoading {
                ProgressView()
            }
                
            TextField("ユーザー名", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                
            SecureField("パスワード", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("ログイン") {
                
                isLoading = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    
                    // 認証処理
                    if username == "test" && password == "1234" {
                        isLoggedIn = true
                        UserDefaults.standard.set(true, forKey: "isLoggedIn")
                        
                    } else {
                        loginFaild = true
                    }
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .disabled(isLoading)
                
            if loginFaild {
                Text("ユーザー名またはパスワードが違います")
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
