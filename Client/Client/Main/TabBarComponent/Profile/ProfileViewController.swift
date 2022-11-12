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
    
    let profileImageView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "person.crop.circle")
        view.tintColor = .white
        return view
    }()
    
    let profileEditImageView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "pencil.line")
        view.tintColor = .white
        return view
    }()
    
//    let stackView = UIStackView().then{
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.axis = .horizontal
//        $0.alignment = .fill
//        $0.spacing = 15
//        $0.distribution = .equalSpacing
//    }
    let myTestView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 15
    }
    let myWriteView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 15
    }
    let myPFView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 15
    }
    let myTestLabel = UILabel().then {
        $0.text = "내 평가"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 15)
    }
    let myWriteLabel = UILabel().then {
        $0.text = "내가 쓴 글"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 15)
    }
    let myPFLabel = UILabel().then {
        $0.text = "내 포트폴리오"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 15)
    }
    
    let stackView1 = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
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
        headerView.addSubview(profileImageView)
        headerView.addSubview(profileEditImageView)
        view.addSubview(myTestView)
        view.addSubview(myWriteView)
        view.addSubview(myPFView)
        myTestView.addSubview(myTestLabel)
        myWriteView.addSubview(myWriteLabel)
        myPFView.addSubview(myPFLabel)
//        headerView.addSubview(stackView)

//        self.stackView.addArrangedSubviews([myTestView, myWriteView, myPFView])
        
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
        profileImageView.snp.makeConstraints{
            $0.width.equalTo(80)
            $0.height.equalTo(80)
            $0.top.equalTo(headerView.snp.top).offset(60)
            $0.trailing.equalTo(headerView.snp.trailing).offset(-30)
            
        }
        profileEditImageView.snp.makeConstraints{
            $0.width.equalTo(20)
            $0.height.equalTo(20)
            $0.bottom.equalTo(profileImageView.snp.bottom)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(-15)
            
        }
        myTestView.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.width.equalTo(100)
            $0.leading.equalTo(view.snp.leading).offset(25)
            $0.top.equalTo(headerView.snp.bottom).offset(-50)
        }
        myWriteView.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.width.equalTo(100)
            $0.leading.equalTo(myTestView.snp.trailing).offset(20)
            $0.top.equalTo(headerView.snp.bottom).offset(-50)
        }
        myPFView.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.width.equalTo(100)
            $0.leading.equalTo(myWriteView.snp.trailing).offset(20)
            $0.top.equalTo(headerView.snp.bottom).offset(-50)
        }
        myTestLabel.snp.makeConstraints({
            $0.centerX.equalTo(myTestView.snp.centerX)
            $0.centerY.equalTo(myTestView.snp.centerY)
        })
        myWriteLabel.snp.makeConstraints{
            $0.centerX.equalTo(myWriteView.snp.centerX)
            $0.centerY.equalTo(myWriteView.snp.centerY)
            
        }
        myPFLabel.snp.makeConstraints{
            $0.centerX.equalTo(myPFView.snp.centerX)
            $0.centerY.equalTo(myPFView.snp.centerY)
            
        }
        
//        stackView.snp.makeConstraints {
//            $0.leading.equalTo(headerView.snp.leading).offset(30)
//            $0.trailing.equalTo(headerView.snp.trailing).offset(30)
//            $0.top.equalTo(headerView.snp.bottom).offset(-50)
//            $0.height.equalTo(100)
//        }
        
        
        
    }

}
