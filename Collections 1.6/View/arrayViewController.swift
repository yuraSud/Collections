

import UIKit

class arrayViewController: UIViewController {
    
    private var arrayLabel = [String]()
    static let storyboardIdentifier = "arrayViewController"
    var arrayModel = ArraysManeger()
    var activityIndicator = UIActivityIndicatorView(style: .medium)
    
    @IBOutlet weak var createArrayButton: UIButton!
    @IBOutlet weak var arrayCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        arrayCollectionView.register(arrayCollectionViewCell.self, forCellWithReuseIdentifier: arrayCollectionViewCell.cellTableIdentifier)
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .init(top: 0, left: 3, bottom: 0, right: 3)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        arrayCollectionView.collectionViewLayout = layout
        setButtonArray()
        setActivityIndicator()
    }
    
    func setButtonArray(){
        createArrayButton.setTitle("Generate an array of integers with 10_000_000 elements", for: .normal)
        createArrayButton.layer.borderWidth = 1
        createArrayButton.layer.borderColor = UIColor.black.cgColor
    }
    
    func setActivityIndicator(){
        activityIndicator.center = createArrayButton.center
        activityIndicator.hidesWhenStopped = true
        createArrayButton.addSubview(activityIndicator)
    }
    
    @IBAction func createArrayBut(_ sender: Any) {
        guard arrayModel.array.isEmpty else {return}
        activityIndicator.startAnimating()
        let cell = arrayCollectionViewCell()
        createArrayButton.backgroundColor = .white
        createArrayButton.setTitle("", for: .normal)
        
        DispatchQueue.global().async{
            let timeCreateArray = cell.createArrayForStart(array: &self.arrayModel)
            DispatchQueue.main.async {
                self.arrayLabel = TitleForCell.arrayLabelMethods
                self.activityIndicator.stopAnimating()
                self.createArrayButton.setTitle("Array creation time: \(timeCreateArray)seconds", for: .normal)
                self.arrayCollectionView.reloadData()
            }
        }
    }
}


extension arrayViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width/2 - 4, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayLabel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: arrayCollectionViewCell.cellTableIdentifier, for: indexPath) as? arrayCollectionViewCell else { return UICollectionViewCell() }
        
        cell.backgroundColor = .lightGray
        cell.setLabelForStartText(for: indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! arrayCollectionViewCell
        
        cell.startActivity()
        
        var timeOperation: Float = 0.0
        
        switch indexPath.row {
        
        case 0 :
            DispatchQueue.global().async{
                timeOperation = self.arrayModel.insertToStartOneByOne()
                DispatchQueue.main.async {
                    cell.setResultTime(time: &timeOperation)
                }
            }
            
        case 1 :
            timeOperation = arrayModel.insertToStartAtOnce()
            
        case 2 :
            DispatchQueue.global().async{
                timeOperation = self.arrayModel.insertToMiddleOneByOne()
                DispatchQueue.main.async {
                    cell.setResultTime(time: &timeOperation)
                }
            }
            
        case 3 :
            timeOperation = arrayModel.insertToMiddleAtOnce()
            
        case 4 :
            DispatchQueue.global().async{
                timeOperation = self.arrayModel.appendToEndOneByOne()
                DispatchQueue.main.async {
                    cell.setResultTime(time: &timeOperation)
                }
            }
            
        case 5 :
            timeOperation = arrayModel.appendToEndAtOnce()
            
        case 6 :
            DispatchQueue.global().async{
                timeOperation = self.arrayModel.removeFirstOneByOne()
                DispatchQueue.main.async {
                    cell.setResultTime(time: &timeOperation)
                }
            }
            
        case 7 :
            timeOperation = arrayModel.removeFirstAtOnce()
            
        case 8 :
            DispatchQueue.global().async{
                timeOperation = self.arrayModel.removeMiddleOneByOne()
                DispatchQueue.main.async {
                    cell.setResultTime(time: &timeOperation)
                }
            }
            
        case 9 :
            timeOperation = arrayModel.removeMiddleAtOnce()
            
        case 10 :
            DispatchQueue.global().async{
                timeOperation = self.arrayModel.removeLastOneByOne()
                DispatchQueue.main.async {
                    cell.setResultTime(time: &timeOperation)
                }
            }
            
        case 11 :
            timeOperation = arrayModel.removeLastAtOnce()
        
        default: break
        }
        
        guard timeOperation != 0 else { return }
            cell.setResultTime(time: &timeOperation)
    }
}
