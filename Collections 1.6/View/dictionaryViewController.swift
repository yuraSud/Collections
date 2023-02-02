

import UIKit

class dictionaryViewController: UIViewController {

    var arrayContact = [Contact]()
    var dictionaryContact: [String:String] = [:]
    var dictionaryStruct = DictionaryStruct()
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
            (self.arrayContact, self.dictionaryContact) = self.createData()
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
        collectionView.register(dictionaryCollectionViewCell.self, forCellWithReuseIdentifier: dictionaryCollectionViewCell.identifier)
        collectionView.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderReusableView.identificator)
    }
    
    func createData() -> ([Contact], [String : String]) {
        var create = DictionaryStruct()
        create.createArrayAndDictionary()
        let array = create.arrayContact
        let dict = create.dictionaryContact
        return (array, dict)
    }
}

extension dictionaryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width/2, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dictionaryStruct.menuItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dictionaryCollectionViewCell.identifier, for: indexPath) as? dictionaryCollectionViewCell else { fatalError("not cell") }
        cell.setLabelForStart(for: indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderReusableView.identificator, for: indexPath) as! HeaderReusableView
        header.configure()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? dictionaryCollectionViewCell else {fatalError("Not found cell at 3th screen")}
        var time: Float = 0
        var text: String? = nil
        
        guard !arrayContact.isEmpty else {return}
        
        switch indexPath.row {
        case 0 :
            (time, text) = dictionaryStruct.findFirstArr(array: arrayContact)
            
        case 1 :
            (time, text) = dictionaryStruct.findFirstDict(dictionary: dictionaryContact)
            
        case 2 :
            (time, text) = dictionaryStruct.findLastArr(array: arrayContact)
            
        case 3 :
            (time, text) = dictionaryStruct.findLasttDict(dictionary: dictionaryContact)
            
        case 4 :
            cell.startActivity()
            DispatchQueue.global().async {
                (time, text) = self.dictionaryStruct.findNoElelentsArr(array: self.arrayContact)
                DispatchQueue.main.async {
                    cell.stopAnimating()
                    cell.setResultTime(time: &time, element: text)
                }
            }
        
        case 5 :
            (time, text) = dictionaryStruct.findNoElementsDict(dictionary:  dictionaryContact)
            
        default: break
        }
        guard time != 0 else { return }
        cell.setResultTime(time: &time, element: text)
    }
}

