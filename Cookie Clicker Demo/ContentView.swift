//
//  ContentView.swift
//  Cookie Clicker Demo
//
//  Created by David Williams on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var cookies = 0
    @State var cookiesPerClick = 1

    var body: some View {
        NavigationStack {
            ZStack {
                background
                VStack {
                    Text("Cookie Clicker")
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundStyle(.white)
                    Text("Cookies: \(cookies)")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                        .padding(40)

                    cookie
                        .padding(.horizontal)
                    Spacer()
                        .padding(.vertical)
                    upgradeButton
                }
            }
        }
    }

    var cookie: some View {
        Button {
            cookies += cookiesPerClick
        } label: {
            Image("Cookie")
                .resizable()
                .scaledToFit()
                .shadow(radius: 10)
        }
    }

    var upgradeButton: some View {
        NavigationLink(destination: UpgradeView(cookies: $cookies, cookiesPerClick: $cookiesPerClick)) {
            Text("Upgrades")
                .font(.largeTitle.bold())
                .foregroundColor(.white)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(20)
        }
    }

    var background: some View {
        LinearGradient(colors: [.blue.opacity(0.5), .blue], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
