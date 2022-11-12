//
//  HomeTableViewCell.swift
//  Client
//
//  Created by 박현준 on 2022/11/13.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    static let identifier = "HomeTableViewCell"
    
    let img : UIImageView = { // 이미지 생성
            let imgView = UIImageView()
            imgView.image = UIImage(named: "dummy1")
            imgView.translatesAutoresizingMaskIntoConstraints = false
            return imgView
        }()
    
    let titleLabel : UILabel = {
            let label = UILabel()
            label.text = "상어상어"
            label.textColor = UIColor.black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    let contentLabel : UILabel = {
            let label = UILabel()
            label.text = "상어상어"
            label.textColor = UIColor.gray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            [img, titleLabel, contentLabel].forEach {
                contentView.addSubview($0)
            }
        
            addContentView()
            autoLayout()
        }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    private func addContentView() {
            contentView.addSubview(img)
            contentView.addSubview(titleLabel)
            contentView.addSubview(contentLabel)
            
        }
        
        private func autoLayout() {
            
            img.snp.makeConstraints {
                $0.leading.top.equalTo(5)
                $0.leading.bottom.equalTo(5)
                $0.size.width.height.equalTo(100)
            }
            
            titleLabel.snp.makeConstraints {
                $0.leading.equalTo(img.snp.trailing).offset(10)
                $0.top.equalTo(10)
                $0.trailing.equalTo(-5)
            }
            
            contentLabel.snp.makeConstraints {
                $0.leading.equalTo(img.snp.trailing).offset(5)
                $0.top.equalTo(5)
                $0.trailing.equalTo(-5)
                $0.leading.bottom.equalTo(5)
            }
        }
    
    
    
    
    
    
    
    
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//    // 셀이 재사용될 때 호출되는 함수
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        backgroundColor = .white
//    }
}
