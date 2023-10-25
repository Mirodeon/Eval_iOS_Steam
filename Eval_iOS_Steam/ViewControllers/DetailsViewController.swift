//
//  DetailsViewController.swift
//  Eval_iOS_Steam
//
//  Created by Student07 on 25/10/2023.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var containerDiscount: UIStackView!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var originalPrice: UILabel!
    @IBOutlet weak var finalPrice: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var logoWindows: UIImageView!
    @IBOutlet weak var logoLinux: UIImageView!
    @IBOutlet weak var logoMac: UIImageView!
    @IBOutlet weak var gamePad: UIImageView!
    @IBOutlet weak var btnIsFav: UIButton!
    
    var game: Game? {
        didSet {
            updateFav()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundLogo()
        setupContent()
        checkFav()
    }
    
    @IBAction func actionBtnInfoSteam(_ sender: Any) {
        if let id = game?.id, let url = URL(string: "https://store.steampowered.com/app/\(id)") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func actionBtnIsFav(_ sender: Any) {
        game?.isFav.toggle()
        if let game = game {
            if(game.isFav) {
                DataManager.shared.addGame(game: game)
            } else {
                DataManager.shared.deleteGameById(id: game.id)
            }
        }
    }
    
    
    private func roundLogo() {
        logoWindows.roundView()
        logoLinux.roundView()
        logoMac.roundView()
        btnIsFav.roundView()
    }
    
    private func checkFav() {
        if let game = game {
            self.game?.isFav = DataManager.shared.checkIfGameIsFav(id: game.id)
        }
    }
    
    private func setupContent() {
        if let game = game {
            image.af.setImage(
                withURL: URL(string: game.largeImage)!,
                placeholderImage: UIImage(systemName: "photo"),
                imageTransition: .crossDissolve(0.7)
            )
            name.text = game.name
            containerDiscount.isHidden = !game.discounted
            price.isHidden = game.discounted
            if (game.discounted) {
                discount.text = "-\(game.discountPercent)%"
                originalPrice.attributedText = game.originalPrice.toCurrency(currency: game.currency).strikeThrough()
                finalPrice.text = game.finalPrice.toCurrency(currency: game.currency)
            } else {
                price.text = game.finalPrice == 0 ? "FREE" : game.finalPrice.toCurrency(currency: game.currency)
            }
            logoWindows.isHidden = !game.windows
            logoLinux.isHidden = !game.linux
            logoMac.isHidden = !game.mac
            gamePad.isHidden = !game.support
            updateFav()
        }
    }
    
    private func updateFav() {
        if let game = game {
            if (isViewLoaded) {
                btnIsFav.tintColor = game.isFav ? .red : .white
                btnIsFav.setImage(UIImage(systemName: game.isFav ? "heart.fill" : "heart"), for: .normal)
            }
        }
    }
}
