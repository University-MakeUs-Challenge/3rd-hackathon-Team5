//
//  ScheduleViewController.swift
//  Client
//
//  Created by 홍준혁 on 2022/11/13.
//

import UIKit
import SnapKit
import Then

class ScheduleViewController: UIViewController {

    var statusBar = UIView()

        var scheduleTitleLabel = UILabel().then {
            $0.text = "일정관리"
        }
    
    lazy var leftStackLabel = UILabel().then {
          $0.text = "성현님의 프로젝트 일정"
          $0.font = UIFont(name: "Avenir-Black", size: 22)
      }


      lazy var stackView = UIStackView().then() {
          $0.axis = .horizontal
          $0.alignment = .fill
          $0.distribution = .equalSpacing
          $0.spacing = 8
      }
    
    private let tableView: UITableView = {
           let tableview = UITableView()
           return tableview
       }()

       func setUpView() {
           view.addSubview(statusBar)
           view.addSubview(scheduleTitleLabel)
           view.addSubview(leftStackLabel)
           view.addSubview(tableView)
           view.backgroundColor = .white

           tableView.snp.makeConstraints { make in
               make.right.left.equalToSuperview()
               make.top.equalTo(leftStackLabel).offset(20)
           }

           statusBar.backgroundColor = UIColor.customColor(.pointColor)
           statusBar.snp.makeConstraints { make in
               make.top.equalToSuperview().offset(50)
               make.right.left.equalToSuperview().offset(0)
               make.height.equalTo(44)
           }

           scheduleTitleLabel.textColor = UIColor.white
           statusBar.snp.makeConstraints { make in
               make.right.left.equalToSuperview()
               make.height.equalTo(44)
               scheduleTitleLabel.snp.makeConstraints { make in
                   make.centerX.equalTo(statusBar)
                   make.centerY.equalTo(statusBar)
               }
           }

           leftStackLabel.backgroundColor = .white
           leftStackLabel.snp.makeConstraints { make in
               make.right.left.equalToSuperview()
               make.height.equalTo(40)
               make.top.equalTo(scheduleTitleLabel).offset(30)
           }
       }

       override func viewDidLoad() {
           super.viewDidLoad()
           setUpView()

       }
}
