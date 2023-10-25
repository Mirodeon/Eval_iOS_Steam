//
//  GameEntityManager.swift
//  Eval_iOS_Steam
//
//  Created by Student07 on 25/10/2023.
//

import Foundation
import CoreData


extension DataManager {
    
    // MARK: - Game
    
    func requestGameDao() -> NSFetchRequest<GameDao> {
        let request = GameDao.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(key: "addedDate", ascending: false),
            NSSortDescriptor(key: "name", ascending: true)
        ]
        return request
    }
    
    func getGameResultsController() -> NSFetchedResultsController<GameDao> {
        return NSFetchedResultsController(
            fetchRequest: requestGameDao(),
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil)
    }
    
    func getGames() -> [GameDao]? {
        let request = requestGameDao()
        return fetch(request)
    }
    
    func addGame(game: Game) {
        let gameDao = GameDao(context: context)
        
        saveContext()
    }

    func deleteGame(_ game: GameDao) {
        context.delete(game)
        saveContext()
    }
}
