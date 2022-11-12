//
//  ButtonStackView.swift
//  Client
//
//  Created by 홍준혁 on 2022/11/13.
//

import Foundation
import Then
import SnapKit
import UIKit

class ButtonStackView:UIView{
    
    let titleLabel = UILabel().then{
        $0.text = "개발 실력"
        $0.font = UIFont(name: "Avenir-Black", size: 20)
    }
    
    let Btn1 = UIButton().then{
        $0.setImage(UIImage(systemName: "star"), for: .normal)
    }
    
    let Btn2 = UIButton().then{
        $0.setImage(UIImage(systemName: "star"), for: .normal)
    }
    
    let Btn3 = UIButton().then{
        $0.setImage(UIImage(systemName: "star"), for: .normal)
    }
    
    let Btn4 = UIButton().then{
        $0.setImage(UIImage(systemName: "star"), for: .normal)
    }
    
    let Btn5 = UIButton().then{
        $0.setImage(UIImage(systemName: "star"), for: .normal)
    }
    
    private let stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 3
    }
    
    
    override init(frame: CGRect) {
        super .init(frame: .zero)
        setViewHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewHierarchy(){
        stackView.addArrangedSubviews([Btn1,Btn2,Btn3,Btn4,Btn5])
        addSubview(titleLabel)
        addSubview(stackView)
    }
    
    func setConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
    }
    
    
}
