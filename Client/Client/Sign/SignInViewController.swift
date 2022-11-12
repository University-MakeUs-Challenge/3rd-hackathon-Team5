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
        $0.text = "하루젝트로"
        $0.font = UIFont(name: "Avenir-Black", size: 28)
    }
    private let titleLabel2 = UILabel().then {
        $0.text = "개발 파트너를 찾아보세요"
        $0.font = UIFont(name: "Avenir-Black", size: 28)
    }
    
    let EmailTextField = UITextField().then{
        $0.placeholder = ("아이디 혹은 이메일 주소")
        $0.setPlaceholder(color: .black)
        $0.layer.cornerRadius = 10
        $0.borderStyle = .none
        
        
    }
    let PasswordTextField = UITextField().then{
        $0.placeholder = ("비밀번호")
//        $0.layer.cornerRadius = 10
        $0.borderStyle = .none
        $0.setPlaceholder(color: .black)
        
        
    }
    
    let SignInButton = UIButton().then{
        $0.backgroundColor = UIColor.customColor(.pointColor)
        $0.layer.cornerRadius = 25
        $0.setTitle("로그인", for: .normal)
        // $0.setTitleColor(.systemBackground, for: .normal)
        
        $0.addTarget(self, action: #selector(pushViewForSignIn), for: .touchUpInside)
    }
    
    let SignUpButton = UIButton().then{
        $0.backgroundColor = UIColor.white
        
        $0.layer.cornerRadius = 10
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(UIColor.gray, for: .normal)
        
        $0.addTarget(self, action: #selector(pushViewForSignUp), for: .touchUpInside)
    }
    let SearchIdButton = UIButton().then{
        $0.backgroundColor = UIColor.white
        $0.layer.cornerRadius = 10
        $0.setTitle("아이디찾기", for: .normal)
        $0.setTitleColor(UIColor.gray, for: .normal)
        $0.addTarget(self, action: #selector(pushViewForSignUp), for: .touchUpInside)
    }
    let SearchPwButton = UIButton().then{
        $0.backgroundColor = UIColor.white
        $0.layer.cornerRadius = 10
        $0.setTitle("비밀번호찾기", for: .normal)
        $0.setTitleColor(UIColor.gray, for: .normal)
        $0.addTarget(self, action: #selector(pushViewForSignUp), for: .touchUpInside)
    }

    
    let stackView = UIStackView().then{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.spacing = 30
        $0.distribution = .equalSpacing
    }
    
    let stackView2 = UIStackView().then{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.spacing = 50
        $0.distribution = .equalSpacing
    }
    
    let stackView3 = UIStackView().then{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.spacing = 20
        $0.distribution = .equalSpacing
    }
    
//

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.realm.readDB()
//        self.realm.resetDB()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        setUIForSignIn()
        
    }
    override func viewDidLayoutSubviews() {
        
        let emailborder = CALayer()
        let passwordborder = CALayer()
        emailborder.frame = CGRect(x: 0, y: EmailTextField.frame.size.height + 12, width: EmailTextField.frame.width, height: 1)
        emailborder.backgroundColor = UIColor.black.cgColor
        EmailTextField.layer.addSublayer(emailborder)
        passwordborder.frame = CGRect(x: 0, y: PasswordTextField.frame.size.height + 12, width: PasswordTextField.frame.width, height: 1)
        passwordborder.backgroundColor = UIColor.black.cgColor
        PasswordTextField.layer.addSublayer(passwordborder)
        

    }

    
    func setUIForSignIn(){
        view.addSubview(titleLabel)
        view.addSubview(titleLabel2)
        view.addSubview(stackView)
        view.addSubview(stackView2)
        view.addSubview(stackView3)
        
        self.stackView.addArrangedSubviews([EmailTextField,PasswordTextField])
        self.stackView2.addArrangedSubviews([SignInButton,stackView3])
        self.stackView3.addArrangedSubviews([SignUpButton, SearchIdButton, SearchPwButton])


        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(150)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
        }
        titleLabel2.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(3)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        SignInButton.snp.makeConstraints{
            $0.height.equalTo(50)
        }
//        underlineView1.snp.makeConstraints{
//            $0.height.equalTo(1)
//            $0.top.equalTo(EmailTextField.snp.bottom).offset(1)
//            $0.leading.equalTo(EmailTextField.snp.leading)
//            $0.trailing.equalTo(EmailTextField.snp.trailing)
//        }
        
        stackView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(100)
            $0.leading.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview().offset(-50)
        }
        
        stackView2.snp.makeConstraints{
            $0.top.equalTo(stackView.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview().offset(-50)
        }
        
//        SignUpButton.snp.makeConstraints{
//            $0.width.equalTo(40)
//        }
//        SearchIdButton.snp.makeConstraints{
//            $0.width.equalTo(40)
//        }
//        SearchPwButton.snp.makeConstraints{
//            $0.width.equalTo(40)
//        }
        
        
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
extension UITextField {
    func setPlaceholder(color: UIColor) {
        guard let string = self.placeholder else {
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
}

//#if DEBUG
//import SwiftUI
//struct ViewControllerRepresentable: UIViewControllerRepresentable {
//
//func updateUIViewController(_ uiView: UIViewController,context: Context) {
//        // leave this empty
//}
//@available(iOS 13.0.0, *)
//func makeUIViewController(context: Context) -> UIViewController{
//    ViewController()
//    }
//}
//@available(iOS 13.0, *)
//struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ViewControllerRepresentable()
//                .ignoresSafeArea()
//                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//        }
//
//    }
//} #endif

extension CALayer {
          
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        
        for edge in arr_edge {
        
            let border = CALayer()

            switch edge {
        
            case UIRectEdge.top:border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
        
            case UIRectEdge.bottom:border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
        
            case UIRectEdge.left:border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
    
            case UIRectEdge.right:border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
                
            default:
                break
        
            }
        
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        
        }
        
    }
        
}
