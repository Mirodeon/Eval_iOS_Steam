//
//  UITabBar+Extension.swift
//  Eval_iOS_Steam
//
//  Created by Student07 on 25/10/2023.
//

import Foundation
import UIKit

extension UITabBar {
    func setCustomAppearance(background: UIColor, selected: UIColor, unselected: UIColor) {
        let appearance = UITabBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = background
        
        let selectedColor: UIColor = selected
        let unselectedColor: UIColor = unselected
        appearance.stackedLayoutAppearance.selected.iconColor = selectedColor
        appearance.stackedLayoutAppearance.selected.titleTextAttributes =
        [.foregroundColor: selectedColor]
        
        appearance.stackedLayoutAppearance.normal.iconColor = unselectedColor
        appearance.stackedLayoutAppearance.normal.titleTextAttributes =
        [.foregroundColor: unselectedColor]
        
        self.standardAppearance = appearance
        self.scrollEdgeAppearance = appearance
    }
}
