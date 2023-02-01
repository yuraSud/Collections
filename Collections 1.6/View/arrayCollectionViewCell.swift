//
//  arrayCollectionViewCell.swift
//  Collections 1.6
//
//  Created by YURA																			 on 25.01.2023.
//

import UIKit

class arrayCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "myArrayCell"
    var array = ArraysModel()
    
    var myLabel: UILabel = {
        let lab = UILabel()
        lab.numberOfLines = 3
        return lab
    }()
    
    var activityIndycator = UIActivityIndicatorView(style: .medium)
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        contentView.contentMode = .center
        contentView.addSubview(myLabel)
        contentView.addSubview(activityIndycator)
        activityIndycator.hidesWhenStopped = true
        activityIndycator.color = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        activityIndycator.translatesAutoresizingMaskIntoConstraints = false
        activityIndycator.center = contentView.center
        myLabel.frame = contentView.bounds
    }
    
    func setLabelForStartText(for indexPath: Int){
        myLabel.text = array.arrayLabelMethods[indexPath].titleLabel
        myLabel.textAlignment = .center
        myLabel.layer.borderWidth = 1
        myLabel.layer.borderColor = UIColor.black.cgColor
    }
    
    func startActivity(){
        myLabel.text = ""
        activityIndycator.startAnimating()
        backgroundColor = .white
    }
    
    func createArrayForStart() -> (Float,[Int]) {
        let timeCreated = array.createArray()
        let fullArray = array.startedArray
        return (timeCreated, fullArray)
    }
    
    func setLabelfirst(timeCreated: Float){
        myLabel.text = "Array creation time: \(timeCreated)seconds"
        backgroundColor = .white
    }
    
    func stopAnimating(){
        activityIndycator.stopAnimating()
    }
    
    func setResultTime(time:inout Float){
        backgroundColor = .white
        activityIndycator.stopAnimating()
        myLabel.text = "Time creations = \(time) sec"
        time = 0
    }
}
