//
//  UINavigationBar+Extension.swift
//  Eval_iOS_Steam
//
//  Created by Student07 on 25/10/2023.
//

import Foundation
import UIKit

extension UINavigationBar {
    func setCustomAppearance(background: UIColor, tint: UIColor) {
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = background
        
        appearance.titleTextAttributes = [.foregroundColor: tint]
        appearance.largeTitleTextAttributes = [.foregroundColor: tint]
        
        self.compactAppearance = appearance
        self.standardAppearance = appearance
        self.scrollEdgeAppearance = appearance
        
        self.tintColor = tint
    }
}
