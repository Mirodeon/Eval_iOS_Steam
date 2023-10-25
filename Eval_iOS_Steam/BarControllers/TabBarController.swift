//
//  TabBarController.swift
//  Eval_iOS_Steam
//
//  Created by Student07 on 25/10/2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.setCustomAppearance(background: .black, selected: .white, unselected: .systemGray2)
    }
}
