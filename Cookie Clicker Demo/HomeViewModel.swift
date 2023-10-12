//
//  HomeViewModel.swift
//  Cookie Clicker Demo
//
//  Created by David Williams on 10/12/23.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var cookies: Int = 0
    @Published var cookieScale: Double = 1
    @Published var upgrades: [Upgrade] = []

    func clickCookie() {
        cookies += calculateAdditionalCookies(currentCookies: 1, remainingUpgrades: upgrades)
        withAnimation {
            self.cookieScale = 0.8
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            withAnimation(.easeInOut) {
                self.cookieScale = 1.0
            }
        }
    }
    
    func addUpgrade(upgrade: Upgrade) {
        if upgrade.price > cookies {
            return
        } else {
            cookies -= upgrade.price
            upgrades.append(upgrade)
        }
    }
    
    private func calculateAdditionalCookies(currentCookies: Int, remainingUpgrades: [Upgrade]) -> Int {
        if remainingUpgrades.isEmpty {
            return currentCookies
        }
        
        let firstUpgrade = remainingUpgrades.first!
        
        let newCookieCount = firstUpgrade.power(currentCookies)
        
        return calculateAdditionalCookies(currentCookies: newCookieCount, remainingUpgrades: Array(remainingUpgrades.dropFirst()))
    }
}
