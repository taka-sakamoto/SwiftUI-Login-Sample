//
//  ContentView.swift
//  Login
//
//  Created by Takayuki Sakamoto on 2026/03/16.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    
    var body: some View {
        
        NavigationStack {
            
            if isLoggedIn {
                HomeView(isLoggedIn: $isLoggedIn)
            } else {
                LoginView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

#Preview {
    ContentView()
}
