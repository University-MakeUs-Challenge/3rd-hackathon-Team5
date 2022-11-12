//
//  HomeItemCollectionViewCell.swift
//  Client
//
//  Created by 박현준 on 2022/11/13.
//

import UIKit

class HomeItemCollectionViewCell: UICollectionViewCell {
    
    private let titleLabel = UILabel().then {
        $0.text = "Sign Up"
        $0.font = UIFont(name: "Avenir-Black", size: 50)
    }
}
