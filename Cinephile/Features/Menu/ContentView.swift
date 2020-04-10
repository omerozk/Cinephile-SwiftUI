//
//  ContentView.swift
//  Cinephile
//
//  Created by omer ozkul on 08/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI

let moviesList: [Movie] = []

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            MoviesView()
                .tabItem {
                    VStack {
                        Image("first")
                        Text("Movies")
                    }
            }
            .tag(0)
            Text("Series")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Series")
                    }
                }
                .tag(1)
            Text("News")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("News")
                    }
                }
                .tag(2)
            ProfileView()
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
