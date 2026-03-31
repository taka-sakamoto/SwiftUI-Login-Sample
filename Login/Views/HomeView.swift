//
//  HomeView.swift
//  Login
//
//  Created by Takayuki Sakamoto on 2026/03/31.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Text("ログイン成功")
            
            Button("ログアウト") {
                viewModel.logout()
            }
        }
    }
}

/*
#Preview {
    HomeView()
}
*/
