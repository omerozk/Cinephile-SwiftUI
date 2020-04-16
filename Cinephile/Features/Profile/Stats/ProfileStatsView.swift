//
//  ProfileStatsView.swift
//  Cinephile
//
//  Created by omer ozkul on 16/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI

struct ProfileStatsView: View {
    private var vm: ProfileStatsView.ViewModel = ViewModel()
    private var media: Stats.Medias?
    
    @State private var favoriteColor = 0
    
    var body: some View {
        ScrollView() {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Network")
                        .font(.title)
                        .padding(.bottom, 6)

                    (Text("Friends") + Text(" \(String(vm.stats?.network.friends ?? 0)) ").bold() +
                        Text("/ Followers") + Text(" \(String(vm.stats?.network.followers ?? 0)) ").bold() +
                        Text("/ Following") + Text(" \(String(vm.stats?.network.following ?? 0)) ").bold())
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                    
                }.padding(.bottom, 20)
                Divider().padding(.horizontal, -10)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Movies")
                        .font(.title)
                        .padding(.bottom, 6)
                    
                    Text("You watched") + Text(" \(String(vm.stats?.movies.watched ?? 0)) ").bold() + Text("movies.")
                    Text("This represent") + Text(" \(vm.stats?.movies.formatedTime ?? "0 min") ").bold() +
                        Text("of screen time!")
                }.padding(.vertical, 20)
                
                Divider().padding(.horizontal, -10)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Series")
                        .font(.title)
                        .padding(.bottom, 6)
                    
                    Text("You watched") + Text(" \(String(vm.stats?.shows.watched ?? 0)) ").bold() + Text("series") +
                        Text(" so") + Text(" \(String(vm.stats?.episodes.watched ?? 0)) ").bold() + Text("episodes.")
                    Text("This represent") + Text(" \(vm.stats?.episodes.formatedTime ?? "0 min") ").bold() +
                        Text("of screen time!")
                }.padding(.vertical, 20)

                Divider().padding(.horizontal, -10)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Ratings (\(String(vm.stats?.ratings.total ?? 0)))")
                        .font(.title)
                        .padding(.bottom, 6)
                    
                    VBarChartView(title: "Movie and series ratings",
                                  items: vm.stats?.ratings.orderedDistribution ?? [(String, Int)](),
                                  maxValue: vm.stats?.ratings.maxValue ?? 0)
                }.padding(.vertical, 20)

                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .padding(.vertical, 20)
        .background(Color.appLightWhite)
        .navigationBarTitle("Stats", displayMode: .inline)
    }
}

struct ProfileStatsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileStatsView()
                .navigationBarTitle("Stats", displayMode: .inline)
        }
    }
}
