//
//  GameDao+CoreDataClass.swift
//  Eval_iOS_Steam
//
//  Created by Student07 on 25/10/2023.
//
//

import Foundation
import CoreData

@objc(GameDao)
public class GameDao: NSManagedObject {
    func toGameObject() -> Game {
        Game(
            id: Int(id),
            name: name,
            discounted: discounted,
            discountPercent: Int(discountPercent),
            originalPrice: Int(originalPrice),
            finalPrice: Int(finalPrice),
            currency: currency,
            smallImage: smallImage,
            largeImage: largeImage,
            windows: windows,
            mac: mac,
            linux: linux,
            support: support,
            isFav: true
        )
    }
}
