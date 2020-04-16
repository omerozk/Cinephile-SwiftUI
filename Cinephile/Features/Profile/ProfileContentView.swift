//
//  ProfileContentView.swift
//  Cinephile
//
//  Created by omer ozkul on 16/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI

struct ProfileContentView: View {
    var user: User

    var body: some View {
        VStack {
            VStack(spacing: 0) {
                HStack() { Spacer() } // hack to make it full width
                CircleImage(image: Image("omer"))
                    .frame(width: 100)
                    .padding(10)
                    .padding(.top, 40)
                
                VStack(alignment: .center, spacing: 4) {
                    Text(user.name)
                        .font(.title)
                        .foregroundColor(.white)
                    HStack {
                        Image("pin")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .aspectRatio(1, contentMode: .fit)
                        Text(user.location)
                            .font(.subheadline)
                            .fontWeight(.light)
                            .foregroundColor(.white)
                    }
                    Text(user.about)
                        .font(.body)
                        .foregroundColor(.white)
                        .lineLimit(3)
                        .padding(.top, 4)
                }
                .padding(0)
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
                .padding(.bottom, 20)
            
            VStack(spacing: 20) {
                NavigationLink(destination: ProfileStatsView(), label: {
                    Text("Stats")
                        .font(.headline)
                        .frame(width: 280, height: 50)
                })
                    .buttonStyle(GradientBackgroundStyle())
                NavigationLink(destination: ProfileStatsView(), label: {
                    Text("Last watched")
                        .font(.headline)
                        .frame(width: 280, height: 50)
                })
                .buttonStyle(GradientBackgroundStyle())
                Spacer()
            }
            Spacer()
        }
        .background(Color.appLightWhite)
    }
}

struct GradientBackgroundStyle: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color.appRed, Color.appBlack]),
                                       startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct ProfileContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileContentView(user: User())
        }
    }
}
