//
//  GradeViewController.swift
//  Client
//
//  Created by 홍준혁 on 2022/11/13.
//

import UIKit
import SnapKit
import Then

class GradeViewController: UIViewController, UITextViewDelegate {
    
    let titleLabel1 = UILabel().then{
        $0.text = "오늘 함께한 파트너에 대한"
        $0.font = UIFont(name: "Avenir-Black", size: 25)
    }
    let titleLabel2 = UILabel().then{
        $0.text = "평가를 남겨주세요"
        $0.font = UIFont(name: "Avenir-Black", size: 25)
    }
    
    let titleLabel3 = UILabel().then{
        $0.text = "코멘트를 남겨보세요!"
        $0.font = UIFont(name: "Avenir-Black", size: 20)
    }
    
    let textField = UITextField().then{
        $0.placeholder = "텍스트를 입력해주세요"
    }

    let SignUpButton = UIButton().then{
        $0.backgroundColor = UIColor.customColor(.pointColor)
        $0.layer.cornerRadius = 10
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(.systemBackground, for: .normal)
        $0.addTarget(self, action: #selector(pushView), for: .touchUpInside)
    }

    
    let level = ButtonStackView()
    let atti = ButtonStackView()
    let time = ButtonStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setUI()
    }
    
    func setUI(){
        
        self.changeTextLabel()
        
        view.addSubview(titleLabel1)
        view.addSubview(titleLabel2)
        
        view.addSubview(level)
        view.addSubview(atti)
        view.addSubview(time)
        
        view.addSubview(titleLabel3)
        view.addSubview(textField)
        view.addSubview(SignUpButton)
        
        
        
        titleLabel1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
        }
        titleLabel2.snp.makeConstraints { make in
            make.top.equalTo(titleLabel1.snp.bottom).offset(5)
            make.centerX.equalTo(titleLabel1)
        }
        
        
        level.snp.makeConstraints { make in
            make.top.equalTo(titleLabel2.snp.bottom).offset(60)
            make.leading.equalToSuperview().offset(30)
        }
        atti.snp.makeConstraints { make in
            make.top.equalTo(level.Btn5.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
        }
        time.snp.makeConstraints { make in
            make.top.equalTo(atti.Btn5.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
        }
        
        titleLabel3.snp.makeConstraints { make in
            make.top.equalTo(time.Btn5.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(40)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel3.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(40)
        }
        
        SignUpButton.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(30)
//            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
        }

    }
    
    func changeTextLabel(){
        self.atti.titleLabel.text = "협업 태도"
        self.time.titleLabel.text = "시간 준수"
    }
    
    @objc func pushView(){
          let nextVC = ScheduleViewController()
          self.navigationController?.pushViewController(nextVC, animated: true)
      }

    
    
}


