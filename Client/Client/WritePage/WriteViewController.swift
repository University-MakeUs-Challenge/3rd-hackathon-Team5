//
//  WriteViewController.swift
//  Client
//
//  Created by 홍준혁 on 2022/11/13.
//

import UIKit
import Then
import SnapKit

class WriteViewController: UIViewController {
    
    let titleLabel1 = UILabel().then{
        $0.text = "프로젝트 생성"
        $0.font = UIFont(name: "Avenir-Black", size: 25)
        $0.textColor = UIColor.customColor(.pointColor)
    }
    
    let labelForNameTextField = UILabel().then{
        $0.text = "지역 선택"
        $0.font = UIFont(name: "Avenir-Black", size: 25)
        $0.textColor = UIColor.customColor(.pointColor)
    }
    let localTextField = UITextField.attributedTextField(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
    
    let labelForMany = UILabel().then{
        $0.text = "모집 인원"
        $0.font = UIFont(name: "Avenir-Black", size: 25)
        $0.textColor = UIColor.customColor(.pointColor)
    }
    let TextField1 = UITextField.attributedTextField(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
    let TextField2 = UITextField.attributedTextField(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
    let TextField3 = UITextField.attributedTextField(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
    let TextField4 = UITextField.attributedTextField(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
    
    let stackView = UIStackView().then{
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 15
    }
    
    let SignUpButton = UIButton().then{
        $0.backgroundColor = UIColor.customColor(.pointColor)
        $0.layer.cornerRadius = 10
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(.systemBackground, for: .normal)
        $0.addTarget(self, action: #selector(pushView), for: .touchUpInside)
    }
    
    let label1 = UILabel().then{
        $0.text = "기획자 몇명?"
        $0.font = UIFont(name: "Avenir-Black", size: 20)
    }
    let label2 = UILabel().then{
        $0.text = "디자이너는 몇명?"
        $0.font = UIFont(name: "Avenir-Black", size: 20)
    }
    let label3 = UILabel().then{
        $0.text = "클라이언트 개발자는 몇명?"
        $0.font = UIFont(name: "Avenir-Black", size: 20)
    }
    let label4 = UILabel().then{
        $0.text = "서버 개발자는 몇명?"
        $0.font = UIFont(name: "Avenir-Black", size: 20)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setui()

    }
    
    func setui(){

        
        view.addSubview(titleLabel1)
        view.addSubview(labelForNameTextField)
        view.addSubview(localTextField)
        view.addSubview(labelForMany)
        
        view.addSubview(SignUpButton)
        
        stackView.addArrangedSubviews([label1,TextField1,label2,TextField2,label3,TextField3,label4,TextField4])
        view.addSubview(stackView)
        
        titleLabel1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
        }
        
        labelForNameTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel1.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        localTextField.snp.makeConstraints { make in
            make.top.equalTo(labelForNameTextField.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        labelForMany.snp.makeConstraints { make in
            make.top.equalTo(localTextField.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
            
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(labelForMany.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        SignUpButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-60)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.centerX.equalToSuperview()
        }
        
    }
    
    @objc func pushView(){
          let nextVC = HomeViewController()
          self.navigationController?.pushViewController(nextVC, animated: true)
      }

    
}
