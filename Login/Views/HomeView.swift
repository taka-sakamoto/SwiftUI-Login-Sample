//
//  HomeView.swift
//  Login
//
//  Created by Takayuki Sakamoto on 2026/03/16.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("ホーム画面")
                .font(.largeTitle)
            
            Button("ログアウト") {
                isLoggedIn = false
                UserDefaults.standard.set(false, forKey: "isLoggedIn")
            }
        }
        .navigationTitle("Home")
    }
}

/*
#Preview {
    HomeView()
}
*/
