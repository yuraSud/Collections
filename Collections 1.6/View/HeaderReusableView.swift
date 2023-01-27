//
//  HeaderReusableView.swift
//  Collections 1.6
//
//  Created by YURA																			 on 27.01.2023.
//

import UIKit

class HeaderReusableView: UICollectionReusableView {
   
    static let identificator =  "HeaderIdentForCollectionView"
    
    private let labelArray: UILabel = {
        let lab = UILabel()
        lab.text = "Array"
        lab.textAlignment = .center
        return lab
    }()
    private let labelDictionary: UILabel = {
        let lab = UILabel()
        lab.text = "Dictionary"
        lab.textAlignment = .center
        return lab
    }()
    var stack = UIStackView()
    
    func configure(){
        stack = UIStackView(arrangedSubviews: [labelArray,labelDictionary])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        addSubview(stack)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        stack.frame = bounds
    }
}
