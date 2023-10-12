//
//  UpgradeView.swift
//  Cookie Clicker Demo
//
//  Created by David Williams on 10/12/23.
//

import SwiftUI

struct UpgradeView: View {
    @ObservedObject var vm: HomeViewModel
    let availableUpgrades = Upgrade.upgrades

    var body: some View {
        ZStack {
            background
            VStack {
                Text("Upgrades")
                    .font(.system(size: 40, weight: .heavy))
                    .foregroundStyle(.white)
                HStack {
                    Text("Cookies: \(vm.cookies)")
                        .font(.system(size: 30, weight: .heavy))
                        .foregroundStyle(.white)
                    Spacer()
                }
                .padding()
                ForEach(availableUpgrades, id: \.name) { upgrade in
                    Button {
                        vm.addUpgrade(upgrade: upgrade)
                    } label: {
                        cellView(upgrade: upgrade)
                            .frame(height: 75)
                            .padding(.horizontal)
                    }
                    .disabled(upgrade.price > vm.cookies)
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
    UpgradeView(vm: HomeViewModel())
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
                    Text(upgrade.powerDescription)
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
