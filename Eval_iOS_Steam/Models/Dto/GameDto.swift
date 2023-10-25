//
//  GameDto.swift
//  Eval_iOS_Steam
//
//  Created by Student07 on 25/10/2023.
//

import Foundation

struct GameDto: Codable {
    let windows: [Game]
    let mac: [Game]
    let linux: [Game]
    
    enum CodingKeys: String, CodingKey {
        case windows = "featured_win"
        case mac = "featured_mac"
        case linux = "featured_linux"
    }
    
    struct Game: Codable {
        let id: Int
        let name: String
        let discounted: Bool
        let discountPercent: Int
        let originalPrice: Int?
        let finalPrice: Int
        let currency: String
        let smallImage: String
        let largeImage: String
        let windows: Bool
        let mac: Bool
        let linux: Bool
        let support: String?
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case discounted
            case discountPercent = "discount_percent"
            case originalPrice = "original_price"
            case finalPrice = "final_price"
            case currency
            case smallImage = "small_capsule_image"
            case largeImage = "large_capsule_image"
            case windows = "windows_available"
            case mac = "mac_available"
            case linux = "linux_available"
            case support = "controller_support"
        }
    }
}

extension GameData: DataFromDto {
    init(dto: GameDto) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        dto.windows.forEach{ game in
            windows.append(
                Game(
                    id: game.id,
                    name: game.name,
                    discounted: game.discounted,
                    discountPercent: game.discountPercent,
                    originalPrice: game.originalPrice ?? 0,
                    finalPrice: game.finalPrice,
                    currency: game.currency,
                    smallImage: game.smallImage,
                    largeImage: game.largeImage,
                    windows: game.windows,
                    mac: game.mac,
                    linux: game.linux,
                    support: (game.support != nil)
                )
            )
        }
        
        dto.mac.forEach{ game in
            mac.append(
                Game(
                    id: game.id,
                    name: game.name,
                    discounted: game.discounted,
                    discountPercent: game.discountPercent,
                    originalPrice: game.originalPrice ?? 0,
                    finalPrice: game.finalPrice,
                    currency: game.currency,
                    smallImage: game.smallImage,
                    largeImage: game.largeImage,
                    windows: game.windows,
                    mac: game.mac,
                    linux: game.linux,
                    support: (game.support != nil)
                )
            )
        }
        
        dto.linux.forEach{ game in
            linux.append(
                Game(
                    id: game.id,
                    name: game.name,
                    discounted: game.discounted,
                    discountPercent: game.discountPercent,
                    originalPrice: game.originalPrice ?? 0,
                    finalPrice: game.finalPrice,
                    currency: game.currency,
                    smallImage: game.smallImage,
                    largeImage: game.largeImage,
                    windows: game.windows,
                    mac: game.mac,
                    linux: game.linux,
                    support: (game.support != nil)
                )
            )
        }
    }
}
