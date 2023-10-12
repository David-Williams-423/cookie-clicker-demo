//
//  ContentView.swift
//  Cookie Clicker Demo
//
//  Created by David Williams on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = HomeViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                background
                VStack {
                    Text("Cookie Clicker")
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundStyle(.white)
                    Text("Cookies: \(vm.cookies)")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                        .padding(40)

                    cookie
                        .padding(.horizontal)
                    Spacer()
                    upgrades
                        .padding(.vertical)
                    upgradeButton
                }
                
            }
        }
    }

    var cookie: some View {
        Button {
            vm.clickCookie()
        } label: {
            Image("Cookie")
                .resizable()
                .scaledToFit()
                .scaleEffect(vm.cookieScale)
                .shadow(radius: 10)
        }
    }

    var upgradeButton: some View {
        NavigationLink(destination: UpgradeView(vm: vm)) {
            Text("Upgrades")
                .font(.largeTitle.bold())
                .foregroundColor(.white)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(20)
        }
    }

    var upgrades: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(vm.upgrades, id: \.name) { upgrade in
                    Image(upgrade.imageString)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                }
            }
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
