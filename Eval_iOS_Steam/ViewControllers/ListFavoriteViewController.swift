//
//  ListFavoriteViewController.swift
//  Eval_iOS_Steam
//
//  Created by Student07 on 25/10/2023.
//

import UIKit
import CoreData

class ListFavoriteViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var resultsController = DataManager.shared.getGameResultsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            UINib(nibName: "FavoriteTableViewCell", bundle: nil),
            forCellReuseIdentifier: "FavoriteTableViewCell"
        )
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .systemGray
        
        resultsController.delegate = self

        DataManager.shared.performFetch(resultsController)
    }

}

extension ListFavoriteViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            tableView.insertSections([sectionIndex], with: .automatic)
        case .delete:
            tableView.deleteSections([sectionIndex], with: .automatic)
        default:
            break
        }
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
        case .move:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .automatic)
        default:
            break
        }
    }
}

extension ListFavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        resultsController.sections?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        resultsController.sections?[section].numberOfObjects ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let game = resultsController.object(at: indexPath)
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier:"FavoriteTableViewCell",
            for: indexPath
        ) as? FavoriteTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setup(game: game.toGameObject())
        
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let game = resultsController.object(at: indexPath)
            DataManager.shared.deleteGame(game)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Details", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() as? DetailsViewController else{
            return
        }
        vc.game = (tableView.cellForRow(at: indexPath) as? FavoriteTableViewCell)?.game
        navigationController?.pushViewController(vc, animated: true)
    }
}
