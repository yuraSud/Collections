

import UIKit

class dictionaryViewController: UIViewController {

    var dictionaryManager = DictionaryManager()
    var activityIndicator = UIActivityIndicatorView(style: .medium)
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentMode = .center
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setActivity()
        view.backgroundColor = .white
        
        DispatchQueue.global(qos: .utility).async {
            self.dictionaryManager.createArrayAndDictionary()
            DispatchQueue.main.async {
                self.collectionView.alpha = 1.0
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    func setActivity(){
        activityIndicator.hidesWhenStopped = true
        let barButton = UIBarButtonItem(customView: activityIndicator)
        self.navigationItem.setRightBarButton(barButton, animated: true)
        activityIndicator.startAnimating()
    }
    
    func setCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView.collectionViewLayout = layout
        collectionView.frame = view.bounds
        collectionView.alpha = 0.1
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(dictionaryCollectionViewCell.self, forCellWithReuseIdentifier: dictionaryCollectionViewCell.identifierForDictionaryCell)
        collectionView.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderReusableView.headerIdentifier)
    }
}

extension dictionaryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width/2, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TitleForCell.dictionaryLabelMethods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dictionaryCollectionViewCell.identifierForDictionaryCell, for: indexPath) as? dictionaryCollectionViewCell else { return UICollectionViewCell() }
        cell.setLabelForStart(for: indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderReusableView.headerIdentifier, for: indexPath) as! HeaderReusableView
        header.configure()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? dictionaryCollectionViewCell else {fatalError("Not found cell at 3th screen")}
        var time: Float = 0
        
        guard !dictionaryManager.arrayContact.isEmpty && !dictionaryManager.dictionaryContact.isEmpty else {return}
        
        cell.startActivity()
        DispatchQueue.global().async {
            
            switch indexPath.row {
            case 0 :
                time = self.dictionaryManager.findFirstArr()
                
            case 1 :
                time = self.dictionaryManager.findFirstDict()
                
            case 2 :
                time = self.dictionaryManager.findLastArr()
                
            case 3 :
                time = self.dictionaryManager.findLasttDict()
                
            case 4 :
                time = self.dictionaryManager.notFindAnythingElelentsInArray()
                
            case 5 :
                time = self.dictionaryManager.notFindAnythingElementsInDictionary()
                
            default: break
            }
            
            guard time != 0 else { return }
           
            DispatchQueue.main.async {
                cell.stopAnimating()
                cell.setResultTime(time: &time)
                
            }
        }
    }
}

