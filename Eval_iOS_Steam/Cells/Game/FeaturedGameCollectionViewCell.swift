//
//  FeaturedGameCollectionViewCell.swift
//  Eval_iOS_Steam
//
//  Created by Student07 on 25/10/2023.
//

import UIKit
import AlamofireImage

class FeaturedGameCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var containerDiscount: UIStackView!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var originalPrice: UILabel!
    @IBOutlet weak var finalPrice: UILabel!
    @IBOutlet weak var price: UILabel!
    
    var game: Game?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(game: Game) {
        self.game = game
        image.af.setImage(
            withURL: URL(string: game.smallImage)!,
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
    }

}
