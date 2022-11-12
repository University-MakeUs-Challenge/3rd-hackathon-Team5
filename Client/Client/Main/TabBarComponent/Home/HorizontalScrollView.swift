//
//  HorizontalScrollView.swift
//  Client
//
//  Created by 박현준 on 2022/11/13.
//

import UIKit

class HorizontalScrollView: BaseScrollView<[UIImage]> {

    let horizontalWidth: CGFloat
    let horizontalHeight: CGFloat

    init(horizontalWidth: CGFloat, horizontalHeight: CGFloat) {
        self.horizontalWidth = horizontalWidth
        self.horizontalHeight = horizontalHeight

        super.init(frame: .zero)

        configure()
    }

    override func configure() {
        super.configure()

        isPagingEnabled = true // scroll이 한번에 되지 않고 swipe 시 하나의 view마다 멈추도록 설정
        showsHorizontalScrollIndicator = false
    }

    override func bind(_ model: [UIImage]) {
        super.bind(model)
        setData()
        updateScrollViewContentWidth()
    }
    
    private func setData() { //cell 이 들어가야댐
            guard let images = model else { return }
            images
                .enumerated()
                .forEach {
                    let imageView = UIImageView(image: $0.element)
                    imageView.contentMode = .scaleAspectFit
                    let xOffset = horizontalWidth * CGFloat($0.offset)

                    imageView.frame = CGRect(x: xOffset, y: 0, width: horizontalWidth, height: horizontalHeight)
                    addSubview(imageView)
                }
        }
    
    private func updateScrollViewContentWidth() { //scrollView의 contentSize를 늘려주어 스크롤이 동작하도록 설정
            contentSize.width = horizontalWidth * CGFloat(model?.count ?? 1)
        }
}

//bind 메소드 내부에 horizontalScroll이 되도록 설정하는 메소드 호출
//setImages(): image들의 offset을 설정하여 scrollView내부에 imageView를 삽입
//updateScrollViewContentWidth(): scrollView의 contentSize를 늘려주어 스크롤이 동작하도록 설정
