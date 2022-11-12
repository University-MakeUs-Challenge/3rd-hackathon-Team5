//
//  UIStackView+.swift
//  Client
//
//  Created by 홍준혁 on 2022/11/12.
//


import Foundation
import UIKit.UIStackView

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
