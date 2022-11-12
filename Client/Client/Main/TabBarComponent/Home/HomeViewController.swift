//
//  HomeViewController.swift
//  Client
//
//  Created by 홍준혁 on 2022/11/13.
//

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController {

    var statusBar = UIView()
    var slideCollectionView = UICollectionView()
    
    private let haruTitleLabel = UILabel().then {
        $0.text = "하루젝트"
        $0.font = UIFont(name: "Avenir-Black", size: 17)
    }
    
    private let projectTitleLabel = UILabel().then {
        $0.text = "추천 프로젝트"
        $0.font = UIFont(name: "Avenir-Black", size: 20)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(statusBar)
        self.view.addSubview(haruTitleLabel)
        self.view.addSubview(projectTitleLabel)
        
        statusBar.backgroundColor = UIColor.customColor(.pointColor)
        haruTitleLabel.textColor = UIColor.white
        statusBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.right.left.equalToSuperview()
            make.height.equalTo(44)
            haruTitleLabel.snp.makeConstraints { make in
                make.centerX.equalTo(statusBar)
                make.centerY.equalTo(statusBar)
            }
        }
        
        projectTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(statusBar.snp.bottom).offset(20)
            make.left.equalTo(20)
            
        }
        
        
        
        
    }
    
  

}

//extension UIColor {
//    convenience init(hex: String) {
//        let scanner = Scanner(string: hex)
//        scanner.scanLocation = 1 // #을 제외한 숫자부터 인지
//
//        var rgbValue: UInt64 = 0
//
//        scanner.scanHexInt64(&rgbValue)
//
//        let r = (rgbValue & 0xff0000) >> 16
//        let g = (rgbValue & 0xff00) >> 8
//        let b = rgbValue & 0xff
//
//        self.init(
//            red: CGFloat(r) / 0xff,
//            green: CGFloat(g) / 0xff,
//            blue: CGFloat(b) / 0xff, alpha: 1
//        )
//    }
//}
