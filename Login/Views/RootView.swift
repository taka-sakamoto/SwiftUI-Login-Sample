//
//  RootView.swift
//  Login
//
//  Created by Takayuki Sakamoto on 2026/03/31.
//

import SwiftUI

struct RootView: View {
    @StateObject var viewModel = AuthViewModel()
    
    var body: some View {
        if viewModel.isLoggedIn {
            HomeView(viewModel: viewModel)
        } else {
            LoginView(viewModel: viewModel)
        }
    }
}

/*
#Preview {
    RootView()
}
*/
