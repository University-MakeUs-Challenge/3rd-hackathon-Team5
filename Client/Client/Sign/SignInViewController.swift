//
//  SignInViewController.swift
//  Client
//
//  Created by 홍준혁 on 2022/11/12.
//

import Foundation
import UIKit
import SnapKit
import Then


class SignInViewController: UIViewController {
    
    
    private let titleLabel = UILabel().then {
        $0.text = "Login"
        $0.font = UIFont(name: "Avenir-Black", size: 50)
    }
    
    let EmailTextField = UITextField().then{
        $0.placeholder = ("Email")
        $0.layer.cornerRadius = 10
        $0.borderStyle = .roundedRect
    }
    let PasswordTextField = UITextField().then{
        $0.placeholder = ("Password")
        $0.layer.cornerRadius = 10
        $0.borderStyle = .roundedRect
        
    }
    
    let SignInButton = UIButton().then{
        $0.backgroundColor = UIColor.black
        $0.layer.cornerRadius = 10
        $0.setTitle("Login", for: .normal)
        // $0.setTitleColor(.systemBackground, for: .normal)
        $0.addTarget(self, action: #selector(pushViewForSignIn), for: .touchUpInside)
    }
    
    let SignUpButton = UIButton().then{
        $0.backgroundColor = UIColor.black
        $0.layer.cornerRadius = 10
        $0.setTitle("For Sign Up", for: .normal)
        $0.setTitleColor(.systemBackground, for: .normal)
        $0.addTarget(self, action: #selector(pushViewForSignUp), for: .touchUpInside)
    }
    
    let stackView = UIStackView().then{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.spacing = 20
        $0.distribution = .equalSpacing
    }
    
    let stackView2 = UIStackView().then{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.spacing = 20
        $0.distribution = .equalSpacing
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.realm.readDB()
//        self.realm.resetDB()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        setUIForSignIn()
        
    }

    
    func setUIForSignIn(){
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        view.addSubview(stackView2)
        self.stackView.addArrangedSubviews([EmailTextField,PasswordTextField])
        self.stackView2.addArrangedSubviews([SignInButton,SignUpButton])


        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(200)
            $0.leading.equalToSuperview().offset(130)
            $0.trailing.equalToSuperview().offset(-100)
        }
        
        stackView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
        }
        
        stackView2.snp.makeConstraints{
            $0.top.equalTo(stackView.snp.bottom).offset(100)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
        }
        
        
    }
    
    @objc func pushViewForSignUp(){
        print("pushView")
        let nextVC = SignUpViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func pushViewForSignIn(){

        
        // 일단 default 로그인 성공으로 가정
        print("pushView")
        let nextVC = CustomTabBarController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
}