//
//  UpgradeView.swift
//  Cookie Clicker Demo
//
//  Created by David Williams on 10/12/23.
//

import SwiftUI

struct UpgradeView: View {
    @Binding var cookies: Int
    @Binding var cookiesPerClick: Int

    let upgrades = [
        Upgrade(name: "Rolling Pin", price: 10, increase: 2, imageString: "RollingPin"),
        Upgrade(name: "Extra Hand", price: 20, increase: 5, imageString: "Hand")
    ]

    var body: some View {
        ZStack {
            background
            VStack {
                Text("Upgrades")
                    .font(.system(size: 40, weight: .heavy))
                    .foregroundStyle(.white)
                HStack {
                    Text("Cookies: \(cookies)")
                        .font(.system(size: 30, weight: .heavy))
                        .foregroundStyle(.white)
                    Spacer()
                }
                .padding()

                ScrollView {
                    ForEach(upgrades, id: \.name) { upgrade in

                        Button {
                            cookies -= upgrade.price
                            cookiesPerClick += upgrade.increase
                        } label: {
                            cellView(upgrade: upgrade)
                        }
                    }
                    .padding()
                }

                Spacer()
            }
        }
    }

    var background: some View {
        LinearGradient(colors: [.blue.opacity(0.5), .blue], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}

#Preview {
    UpgradeView(cookies: .constant(80), cookiesPerClick: .constant(1))
}

struct cellView: View {
    var upgrade: Upgrade

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.thinMaterial)

            HStack {
                Image(upgrade.imageString)
                    .padding(.horizontal)

                VStack(alignment: .leading) {
                    Text(upgrade.name)
                        .font(.title)
                    Text("Increase: \(upgrade.increase)")
                        .font(.subheadline)
                }
                Spacer()
                Text("\(upgrade.price)")
                    .font(.title2).bold()
                    .padding(.horizontal)
            }
            .padding(5)
        }
        .cornerRadius(20)
    }
}

struct Upgrade {
    var name: String
    var price: Int
    var increase: Int
    var imageString: String
}
