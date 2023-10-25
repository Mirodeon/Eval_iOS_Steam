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
        gameDao.name = game.name
        gameDao.id = Int64(game.id)
        gameDao.discounted = game.discounted
        gameDao.discountPercent = Int64(game.discountPercent)
        gameDao.originalPrice = Int64(game.originalPrice)
        gameDao.finalPrice = Int64(game.finalPrice)
        gameDao.currency = game.currency
        gameDao.smallImage = game.smallImage
        gameDao.largeImage = game.largeImage
        gameDao.windows = game.windows
        gameDao.mac = game.mac
        gameDao.linux = game.linux
        gameDao.support = game.support
        gameDao.addedDate = "\(Date.now.timeIntervalSince1970)"
        saveContext()
    }

    func deleteGame(_ game: GameDao) {
        context.delete(game)
        saveContext()
    }
    
    func deleteGameById(id: Int) {
        let gameArray = fetch(requestGameDaoById(id: id))
        if let game = gameArray?.first{
            deleteGame(game)
        } else {
            print("Unable to retrieve game.")
        }
    }
    
    func checkIfGameIsFav(id: Int) -> Bool {
        do {
            let count = try context.count(for: requestGameDaoById(id: id))
            return count > 0
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return false
        }
    }
    
    func requestGameDaoById(id: Int) -> NSFetchRequest<GameDao> {
        let safeId = Int64(id)
        let request = GameDao.fetchRequest()
        request.fetchLimit =  1
        request.predicate = NSPredicate(format: "id == %d" ,safeId)
        return request
    }
}
