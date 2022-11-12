//
//  ProfileViewController.swift
//  Client
//
//  Created by 홍준혁 on 2022/11/13.
//

import Foundation
import UIKit
import SnapKit
import Then


class ProfileViewController: UIViewController {

    let headerView = UIView().then {
        $0.backgroundColor = UIColor.customColor(.pointColor)
    }
    
    let myPageLabel = UILabel().then {
        $0.text = "마이페이지"
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 15)
    }
    
    let usernameLabel = UILabel().then {
        $0.text = "김성현"
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 23)
    }
    let roleView = UIView().then {
        $0.backgroundColor = .systemCyan
        $0.layer.cornerRadius = 15
    }
    let roleLabel = UILabel().then {
        $0.text = "개발자"
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 15)
    }
    let expView = UIView().then {
        $0.backgroundColor = .systemCyan
        $0.layer.cornerRadius = 15
    }
    let expLabel = UILabel().then {
        $0.text = "프로젝트 3회차"
        $0.textColor = .white
        $0.font = . boldSystemFont(ofSize: 15)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        SetUIForProfile()
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        headerView.layer.cornerRadius = 30
        headerView.layer.masksToBounds = true

//        let path = UIBezierPath(roundedRect: headerView.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 12, height: 12))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        headerView.layer.mask = mask
//        headerView.layer.masksToBounds = true
    }
    
    func SetUIForProfile(){
        view.addSubview(headerView)
        headerView.addSubview(myPageLabel)
        headerView.addSubview(usernameLabel)
        headerView.addSubview(roleView)
        roleView.addSubview(roleLabel)
        headerView.addSubview(expView)
        expView.addSubview(expLabel)
        
        headerView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(100)
            $0.width.equalToSuperview()
            $0.height.equalTo(200)
        }
        myPageLabel.snp.makeConstraints{
            $0.top.equalTo(headerView.snp.top).offset(10)
            $0.centerX.equalTo(headerView.snp.centerX)
        }
        usernameLabel.snp.makeConstraints{
            $0.top.equalTo(headerView.snp.top).offset(70)
            $0.leading.equalTo(headerView.snp.leading).offset(40)
        }
        roleView.snp.makeConstraints{
            $0.leading.equalTo(usernameLabel.snp.leading)
            $0.trailing.equalTo(usernameLabel.snp.trailing)
            $0.top.equalTo(usernameLabel.snp.bottom).offset(8)
            $0.height.equalTo(25)
        }
        roleLabel.snp.makeConstraints{
            $0.centerX.equalTo(roleView.snp.centerX)
            $0.centerY.equalTo(roleView.snp.centerY)
        }
        expView.snp.makeConstraints {
            $0.leading.equalTo(roleView.snp.trailing).offset(10)
            $0.centerY.equalTo(roleView.snp.centerY)
            $0.width.equalTo(110)
            $0.height.equalTo(25)
        }
        expLabel.snp.makeConstraints {
            $0.centerY.equalTo(expView.snp.centerY)
            $0.centerX.equalTo(expView.snp.centerX)
        }
        
    }

}
