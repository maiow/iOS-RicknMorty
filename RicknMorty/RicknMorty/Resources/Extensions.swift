//
//  Extensions.swift
//  RicknMorty
//
//  Created by mivanovskaya on 06.09.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach ({
            addSubview($0)
        })
    }
}
