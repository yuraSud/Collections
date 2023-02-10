

import UIKit

class dictionaryCollectionViewCell: UICollectionViewCell {
    
    var dictManager = DictionaryManager()
    
    var activityIndicator = UIActivityIndicatorView(style: .medium)
    static let identifierForDictionaryCell = "myCell"
    
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
        setActivity()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
        activityIndicator.center = contentView.center
    }
   
    func startActivity(){
        label.text = ""
        activityIndicator.startAnimating()
        backgroundColor = .white
    }
    
    func stopAnimating(){
        activityIndicator.stopAnimating()
    }
    
    func setActivity(){
        contentView.addSubview(activityIndicator)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .red
    }
    
    func setLabelForStart(for indexPath: Int){
        label.text = TitleForCell.dictionaryLabelMethods[indexPath]
        backgroundColor = .secondaryLabel
    }
    
    func setResultTime(time:inout Float){
        label.text = "Search time = \(time) sec"
        backgroundColor = .white
        time = 0
    }
}
