//
//  UpgradeView.swift
//  Cookie Clicker Demo
//
//  Created by David Williams on 10/12/23.
//

import SwiftUI

struct UpgradeView: View {

    var body: some View {
        ZStack {
            background
            VStack {
                Text("Upgrades")
                    .font(.system(size: 40, weight: .heavy))
                    .foregroundStyle(.white)
                HStack {
                    Text("Cookies: 100")
                        .font(.system(size: 30, weight: .heavy))
                        .foregroundStyle(.white)
                    Spacer()
                }
                .padding()
                cellView()
                cellView()
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
    UpgradeView()
}

struct cellView: View {

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.thinMaterial)

            HStack {
                Image("RollingPin")
                    .padding(.horizontal)

                VStack(alignment: .leading) {
                    Text("Rolling Pin")
                        .font(.title)
                    Text("Extra 5 cookies per click")
                        .font(.subheadline)
                }
                Spacer()
                Text("50")
                    .font(.title2).bold()
                    .padding(.horizontal)
            }
            .padding(5)
        }
        .cornerRadius(20)
    }
}
