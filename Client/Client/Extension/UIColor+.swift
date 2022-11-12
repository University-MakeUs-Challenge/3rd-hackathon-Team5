//
//  UIColor+.swift
//  Client
//
//  Created by 홍준혁 on 2022/11/13.
//

import Foundation
import UIKit.UIColor

enum CustomColor {
    case pointColor
}

extension UIColor {
    
    static func customColor(_ color: CustomColor) -> UIColor {
           switch color {
           case .pointColor:
               return UIColor(red: 0.008, green: 0.4, blue: 0.749, alpha: 1.0)
           }
        }
    
    }

