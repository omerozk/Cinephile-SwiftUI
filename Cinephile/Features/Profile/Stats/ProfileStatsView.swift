//
//  ProfileStatsView.swift
//  Cinephile
//
//  Created by omer ozkul on 16/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI

struct ProfileStatsView: View {
    private var viewModel: ProfileStatsView.ViewModel = ViewModel()
    @State private var favoriteColor = 0

    var body: some View {
        VStack {
            Text("NETWORK")
                .frame(height: 200)
            Picker(selection: $favoriteColor, label: Text("")) {
                Text("Movies").tag(0)
                Text("Series").tag(1)
            }.pickerStyle(SegmentedPickerStyle()).padding(8)

            Text("")
            Text("")
            Spacer()
        }
    }
}

struct ProfileStatsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileStatsView()
    }
}
