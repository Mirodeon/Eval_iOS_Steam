//
//  GameData.swift
//  Eval_iOS_Steam
//
//  Created by Student07 on 25/10/2023.
//

import Foundation

struct GameData {
    var windows: [Game] = Array()
    var mac: [Game] = Array()
    var linux: [Game] = Array()
}

struct Game: Identifiable, Hashable {
    let id: Int
    let name: String
    let discounted: Bool
    let discountPercent: Int
    let originalPrice: Int
    let finalPrice: Int
    let currency: String
    let smallImage: String
    let largeImage: String
    let windows: Bool
    let mac: Bool
    let linux: Bool
    let support: Bool
    var isFav: Bool = false
}
