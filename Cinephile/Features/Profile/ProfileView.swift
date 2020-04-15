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

struct ProfileContentView: View {
    var user: User

    var body: some View {
        VStack(spacing: 0) {
            HStack() { Spacer() } // hack to make it full width
            CircleImage(image: Image("omer"))
                .frame(width: 100)
                .padding(10)
                .padding(.top, 40)
            
            VStack(alignment: .center) {
                Text(user.name)
                    .font(.title)
                    .foregroundColor(.white)
                Text(user.location)
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
            }
            .padding(0)
            Spacer()
        }
        .background(VStack {
            Image("omer")
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .clipped()
                .blur(radius: 7, opaque: true)
            Spacer()
        })
        .edgesIgnoringSafeArea(.top)
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
