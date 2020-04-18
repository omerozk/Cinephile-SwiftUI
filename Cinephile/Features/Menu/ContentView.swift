//
//  ContentView.swift
//  Cinephile
//
//  Created by omer ozkul on 08/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            MoviesView(viewModel: MoviesView.ViewModel())
                .tabItem {
                    VStack {
                        Image("watched")
                        Text("Watched")
                    }
            }
            .tag(0)
            TrendingView()
                .tabItem {
                    VStack {
                        Image("trend")
                        Text("Trending")
                    }
            }
            .tag(1)
            ProfileView(viewModel: ProfileView.ViewModel())
                .tabItem {
                    VStack {
                        Image("user")
                        Text("Profile")
                    }
                }
            .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
