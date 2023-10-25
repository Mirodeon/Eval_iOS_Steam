//
//  GameApiService.swift
//  Eval_iOS_Steam
//
//  Created by Student07 on 25/10/2023.
//

import Foundation

class GameApiService: NetworkService {
    
    static let shared = GameApiService()
    
    // MARK: - GET Games

    typealias GamesCompletionHandler = CompletionHandler<GameDto, GameData>
    
    private func loadGame(url: String, completionHandler: @escaping GamesCompletionHandler) {
        load(url: url, typeCodable: GameDto.self, typeFromDto: GameData.self, completionHandler: completionHandler)
    }
    
    func getFeaturedWinGames(completionHandler: @escaping GamesCompletionHandler) {
        loadGame(url: EndPoint.featureGame.urlBuilder(), completionHandler: completionHandler)
    }
}
