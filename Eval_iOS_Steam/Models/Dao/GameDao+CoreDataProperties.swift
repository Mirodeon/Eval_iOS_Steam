//
//  GameDao+CoreDataProperties.swift
//  Eval_iOS_Steam
//
//  Created by Student07 on 25/10/2023.
//
//

import Foundation
import CoreData


extension GameDao {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameDao> {
        return NSFetchRequest<GameDao>(entityName: "GameDao")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String
    @NSManaged public var discounted: Bool
    @NSManaged public var discountPercent: Int64
    @NSManaged public var originalPrice: Int64
    @NSManaged public var finalPrice: Int64
    @NSManaged public var currency: String
    @NSManaged public var smallImage: String
    @NSManaged public var largeImage: String
    @NSManaged public var windows: Bool
    @NSManaged public var mac: Bool
    @NSManaged public var linux: Bool
    @NSManaged public var support: Bool
    @NSManaged public var addedDate: String

}

extension GameDao : Identifiable {

}
