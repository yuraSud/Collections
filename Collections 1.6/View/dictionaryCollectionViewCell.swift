//
//  dictionaryCollectionViewCell.swift
//  Collections 1.6
//
//  Created by YURA																			 on 26.01.2023.
//

import UIKit

class dictionaryCollectionViewCell: UICollectionViewCell {
    var dictStruct = DictionaryStruct()
    
    static let identifier = "myCell"
    let label : UILabel = {
        let lab = UILabel()
        lab.text = "yura"
        lab.layer.borderWidth = 1
        lab.layer.borderColor = UIColor.black.cgColor
        lab.textAlignment = .center
        lab.numberOfLines = 3
        return lab
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
    }
    
    func setLabelForStart(for indexPath: Int){
        label.text = dictStruct.menuItem[indexPath]
        backgroundColor = .secondaryLabel
    }
    func setResultTime(time:Float, element: String?){
        if element != nil, let text = element {
            label.text = "\(text)\nSearch time = \(time) sec"
        } else {
            label.text = "Element not Found \n Search time = \(time) sec"
        }
        backgroundColor = .white
    }
}
