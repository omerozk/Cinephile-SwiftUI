//
//  ProfileView.swift
//  Cinephile
//
//  Created by omer ozkul on 09/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI

struct ProfileEmptyView: View {
    var body: some View {
        VStack { Text("Loading...") }
    }
}

struct ProfileView: View {
    @ObservedObject var viewModel: ViewModel
    
    private func isUserExist(user: User?) -> Bool {
        return user != nil
    }
    
    var body: some View {
        NavigationView {
            if viewModel.user == nil {
                ProfileEmptyView()
            } else {
                ProfileContentView(user: viewModel.user!)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileView.ViewModel())
    }
}
