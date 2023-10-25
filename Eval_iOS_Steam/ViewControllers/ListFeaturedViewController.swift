//
//  ListFeaturedViewController.swift
//  Eval_iOS_Steam
//
//  Created by Student07 on 25/10/2023.
//

import UIKit

class ListFeaturedViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource: UICollectionViewDiffableDataSource<Int, Game>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.register(
            UINib(nibName: "FeaturedGameCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "FeaturedGameCollectionViewCell"
        )
        dataSource = UICollectionViewDiffableDataSource<Int, Game>(collectionView: collectionView) { (collectionView, indexPath, game) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedGameCollectionViewCell", for: indexPath) as! FeaturedGameCollectionViewCell
            cell.setup(game: game)
            return cell
        }
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        getDataGame()
    }
    
    private func getDataGame() {
        GameApiService.shared.getFeaturedGames { data, error in
            if let data = data {
                var snapshot = NSDiffableDataSourceSnapshot<Int, Game>()
                snapshot.appendSections([1])
                snapshot.appendItems(data.windows, toSection: 1)
                snapshot.appendItems(data.mac, toSection: 1)
                snapshot.appendItems(data.linux, toSection: 1)
                self.dataSource?.apply(snapshot)
            }
        }
    }
}

extension ListFeaturedViewController: UICollectionViewDelegate {
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            switch sectionIndex {
            case 0 :
                return self.listSection()
            default:
                return self.listSection()
            }
        }
        return layout
    }
    
    func listSection() -> NSCollectionLayoutSection {
        let inset: CGFloat = 2.5
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        return section
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Details", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() as? DetailsViewController else{
            return
        }
        vc.game = (collectionView.cellForItem(at: indexPath) as? FeaturedGameCollectionViewCell)?.game
        navigationController?.pushViewController(vc, animated: true)
    }
   
}
