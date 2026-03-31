//
//  AuthViewModel.swift
//  Login
//
//  Created by Takayuki Sakamoto on 2026/03/31.
//

import SwiftUI
import Combine

class AuthViewModel : ObservableObject {
    
    @Published var isLoggedIn: Bool = false
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {
        loadLoginState()
    }
    
    // ログイン処理
    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "メールとパスワードを入力してください"
            return
        }
        
        if email == "test@test.com" && password == "1234" {
            isLoggedIn = true
            errorMessage = ""
            saveLoginState(true)
        } else {
            errorMessage = "ログイン情報が正しくありません"
        }
    }
    
    // ログアウト
    func logout() {
        isLoggedIn = false
        email = ""
        password = ""
        saveLoginState(false)
    }
    
    // 保存
    private func saveLoginState(_ state: Bool) {
        UserDefaults.standard.set(state, forKey: "isLoggedIn")
    }
    
    // 読み込み
    private func loadLoginState() {
        isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    
}

/*
#Preview {
    AuthViewModel()
}
*/
