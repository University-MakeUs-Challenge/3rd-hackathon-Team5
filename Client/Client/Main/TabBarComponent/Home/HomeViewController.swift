//
//  HomeViewController.swift
//  Client
//
//  Created by 홍준혁 on 2022/11/13.
//

import UIKit

class HomeViewController: UIViewController {

    var topBar = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(topBar)
        
        topBar.backgroundColor = UIColor(hex: "D9D9D9")
    }
    
    
    

}

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 1 // #을 제외한 숫자부터 인지
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
