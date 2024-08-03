//
//  Extensions.swift
//  MemoryGame
//
//  Created by Diggo Silva on 03/08/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach({ addSubview($0.self) })
    }
}
