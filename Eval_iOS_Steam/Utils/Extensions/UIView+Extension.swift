//
//  UIView+Extension.swift
//  Eval_iOS_Steam
//
//  Created by Student07 on 25/10/2023.
//

import Foundation
import UIKit

extension UIView {
    func roundView(_ radius: CGFloat = 0) {
        self.layer.cornerRadius = radius == 0 ? self.frame.size.height/2 : radius
    }
}
