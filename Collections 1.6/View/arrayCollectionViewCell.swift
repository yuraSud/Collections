//
//  arrayCollectionViewCell.swift
//  Collections 1.6
//
//  Created by YURA																			 on 25.01.2023.
//

import UIKit

class arrayCollectionViewCell: UICollectionViewCell {
    
    static let cellTableIdentifier = "myArrayCell"
   //var array = ArraysModel()
    
    var myLabel: UILabel = {
        let lab = UILabel()
        lab.numberOfLines = 3
        return lab
    }()
    
    var activityIndicator = UIActivityIndicatorView(style: .medium)
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        contentView.contentMode = .center
        contentView.addSubview(myLabel)
        contentView.addSubview(activityIndicator)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.center = contentView.center
        myLabel.frame = contentView.bounds
    }
    
    func setLabelForStartText(for indexPath: Int){
        myLabel.text = TitleForCell.arrayLabelMethods[indexPath]
        myLabel.textAlignment = .center
        myLabel.layer.borderWidth = 1
        myLabel.layer.borderColor = UIColor.black.cgColor
    }
    
    func startActivity(){
        myLabel.text = ""
        activityIndicator.startAnimating()
        backgroundColor = .white
    }
    
    func createArrayForStart(array:inout ArraysManager) -> Float {
        let timeCreated = array.createArray()
        return timeCreated
    }
    
    func setLabelfirst(timeCreated: Float){
        myLabel.text = "Array creation time: \(timeCreated)seconds"
        backgroundColor = .white
    }
    
    func stopAnimating(){
        activityIndicator.stopAnimating()
    }
    
    func setResultTime(time:inout Float){
        backgroundColor = .white
        activityIndicator.stopAnimating()
        myLabel.text = "Time creations = \(time) sec"
        time = 0
    }
}

