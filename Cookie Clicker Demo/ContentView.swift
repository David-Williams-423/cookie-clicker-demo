//
//  ContentView.swift
//  Cookie Clicker Demo
//
//  Created by David Williams on 10/12/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
            ZStack {
                background
                VStack {
                    Text("Cookie Clicker")
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundStyle(.white)
                    Text("Cookies: 100")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                        .padding(40)

                    cookie
                        .padding(.horizontal)
                    Spacer()
                    upgradeButton
                }
            }
        
    }

    var cookie: some View {
        Image("Cookie")
            .resizable()
            .scaledToFit()
            .shadow(radius: 10)
    }

    var upgradeButton: some View {
        Text("Upgrades")
            .font(.largeTitle.bold())
            .foregroundColor(.white)
            .padding()
            .background(.thinMaterial)
            .cornerRadius(20)
    }

//    var upgrades: some View {
//        let upgrades: [Upgrade] = []
//        return HStack {
//            ForEach(upgrades, id: \.name) { upgrade in
//                Image(upgrade.imageString)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(height: 50)
//            }
//        }
//    }

    var background: some View {
        LinearGradient(colors: [.blue.opacity(0.5), .blue], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
