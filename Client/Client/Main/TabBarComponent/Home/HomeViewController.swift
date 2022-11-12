//
//  HomeViewController.swift
//  Client
//
//  Created by 홍준혁 on 2022/11/13.
//

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    
    

    var statusBar = UIView()
    var pageControll = UIPageControl()
    var table = UITableView()
    
    
    private let haruTitleLabel = UILabel().then {
        $0.text = "하루젝트"
        $0.font = UIFont(name: "Avenir-Black", size: 17)
    }
    
    private let projectTitleLabel = UILabel().then {
        $0.text = "추천 프로젝트"
        $0.font = UIFont(name: "Avenir-Black", size: 20)
    }
    
    private let resentTitleLabel = UILabel().then {
        $0.text = "최신순"
        $0.font = UIFont(name: "Avenir-Black", size: 12)
    }
    
    private let writeButton = UIButton().then{
        $0.backgroundColor = UIColor.customColor(.pointColor)
        $0.layer.cornerRadius = 10
        $0.setTitle("글쓰기", for: .normal)
        // $0.setTitleColor(.systemBackground, for: .normal)
        $0.addTarget(self, action: #selector(pushViewForWrite), for: .touchUpInside)
    }
        
        // 슬라이드 스크롤뷰
        lazy var horizontalScrollView: HorizontalScrollView = {
            let view = HorizontalScrollView(horizontalWidth: view.frame.width, horizontalHeight: view.frame.height)
            
            return view
        }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        setUI()
        table.delegate = self
        table.dataSource = self
        
    }
    
        func setUI() {
            view.addSubview(statusBar)
            view.addSubview(haruTitleLabel)
            view.addSubview(projectTitleLabel)
            view.addSubview(horizontalScrollView)
            view.addSubview(resentTitleLabel)
            view.addSubview(table)
            view.addSubview(writeButton)
            
            horizontalScrollView.backgroundColor = .black
            
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
            
            horizontalScrollView.snp.makeConstraints { make in
                make.top.equalTo(projectTitleLabel.snp.bottom).offset(20)
                make.left.equalTo(30)
                make.right.equalTo(-30)
                make.height.equalTo(200)
            }
            
            resentTitleLabel.snp.makeConstraints { make in
                make.top.equalTo(horizontalScrollView.snp.bottom).offset(20)
                make.right.equalTo(-30)
            }
            
            table.snp.makeConstraints { make in
                make.top.equalTo(resentTitleLabel.snp.bottom).offset(20)
                make.left.right.equalTo(0)
                make.height.equalTo(110)
                
            }
            
            writeButton.snp.makeConstraints { make in
                make.bottom.equalToSuperview().offset(-70)
                make.right.equalToSuperview().offset(-35)
                make.width.equalTo(80)
                make.height.equalTo(30)
            }
        }
    
    // 뷰에 셀
    func setupViews() {
            view.backgroundColor = .white
//            let image1 = UIImage(named: "image1")!
//            let image2 = UIImage(named: "image2")!
//            let image3 = UIImage(named: "image3")!
//
//            horizontalScrollView.model = [image1, image2, image3]
        }
    
    //테이블 뷰
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 데이터 리스트값.count
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as? HomeTableViewCell else { return .init() }
            
//        let target = Memo.dummyMemoList[indexPath.row]
        
//        cell.titleLabel.text = target.title
//        cell.contentLabel.text = target.content
        return cell
    }
    
    // cell을 클릭시 또는 선택시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
  
    @objc func pushViewForWrite() {
            //글쓰기 화면으로 전환
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
