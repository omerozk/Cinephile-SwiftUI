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
            MoviesView(viewModel: MoviesView.MoviesViewModel())
                .tabItem {
                    VStack {
                        Image("first")
                        Text("Watched Movies")
                    }
            }
            .tag(0)
            Text("Series")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Watched Series")
                    }
                }
                .tag(1)
            TrendingView()
                .tabItem {
                    VStack {
                        Image("first")
                        Text("Trending")
                    }
            }
            .tag(2)
            ProfileView(viewModel: ProfileView.ViewModel())
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Profile")
                    }
                }
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
