//
//  arrayViewController.swift
//  Collections 1.6
//
//  Created by YURA																			 on 25.01.2023.
//

import UIKit

class arrayViewController: UIViewController {
    
    private var numberCells = 1
    private var fullArray = [Int]()
    private var timeCreateArray: Float = 0.0
    static let ident = "arrayViewController"
    
    @IBOutlet weak var arrayCollectionView: UICollectionView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        arrayCollectionView.register(arrayCollectionViewCell.self, forCellWithReuseIdentifier: arrayCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .init(top: 0, left: 3, bottom: 0, right: 3)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        arrayCollectionView.collectionViewLayout = layout
        arrayCollectionView.frame = view.bounds
    }
}

extension arrayViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard indexPath.row != 0 else {
            return CGSize(width: view.frame.width, height: 90)
        }
        return CGSize(width: view.frame.width/2 - 4, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: arrayCollectionViewCell.identifier, for: indexPath) as! arrayCollectionViewCell
        cell.backgroundColor = .lightGray
        cell.setLabelForStartText(for: indexPath.row)
        
        if indexPath.row == 0 && numberCells != 1 {
            cell.setLabelfirst(timeCreated: timeCreateArray)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! arrayCollectionViewCell
        
        switch indexPath.row {
        case 0 where numberCells == 1 :
            cell.startActivity()
            DispatchQueue.global().async{
                (self.timeCreateArray, self.fullArray) = cell.createArrayForStart()
                DispatchQueue.main.async {
                    self.appendCells()
                    cell.stopAnimating()
                }
            }
            
        case 1 :
            cell.startActivity()
            DispatchQueue.global().async{
                print(self.fullArray.count)
                let timeOperation = cell.array.insertToStartOneByOne(array: self.fullArray)
                DispatchQueue.main.async {
                    cell.stopAnimating()
                    cell.setResultTime(time: timeOperation)
                    print(self.fullArray.count)
                }
            }
            
        case 2 :
            let timeOperation = cell.array.insertToStartAtOnce(array: fullArray)
            cell.setResultTime(time: timeOperation)
            
        case 3 :
            cell.startActivity()
            DispatchQueue.global().async{
                let timeOperation = cell.array.insertToMiddleOneByOne(array: self.fullArray)
                DispatchQueue.main.async {
                    cell.stopAnimating()
                    cell.setResultTime(time: timeOperation)
                }
            }
            
        case 4 :
            let timeOperation = cell.array.insertToMiddleAtOnce(array: fullArray)
            cell.setResultTime(time: timeOperation)
            
        case 5 :
            cell.startActivity()
            DispatchQueue.global().async{
                let timeOperation = cell.array.appendToEndOneByOne(array: self.fullArray)
                DispatchQueue.main.async {
                    cell.stopAnimating()
                    cell.setResultTime(time: timeOperation)
                }
            }
            
        case 6 :
            let timeOperation = cell.array.appendToEndAtOnce(array: fullArray)
            cell.setResultTime(time: timeOperation)
            
        case 7 :
            cell.startActivity()
            DispatchQueue.global().async{
                let timeOperation = cell.array.removeFirstOneByOne(array: self.fullArray)
                DispatchQueue.main.async {
                    cell.stopAnimating()
                    cell.setResultTime(time: timeOperation)
                }
            }
            
        case 8 :
            let timeOperation = cell.array.removeFirstAtOnce(array: fullArray)
            cell.setResultTime(time: timeOperation)
            
        case 9 :
            cell.startActivity()
            DispatchQueue.global().async{
                let timeOperation = cell.array.removeMiddleOneByOne(array:  self.fullArray)
                DispatchQueue.main.async {
                    cell.stopAnimating()
                    cell.setResultTime(time: timeOperation)
                }
            }
            
        case 10 :
            let timeOperation = cell.array.removeMiddleAtOnce(array: fullArray)
            cell.setResultTime(time: timeOperation)
            
        case 11 :
            cell.startActivity()
            DispatchQueue.global().async{
                let timeOperation = cell.array.removeLastOneByOne(array: self.fullArray)
                DispatchQueue.main.async {
                    cell.stopAnimating()
                    cell.setResultTime(time: timeOperation)
                }
            }
            
        case 12 :
            let timeOperation = cell.array.removeLastAtOnce(array: fullArray)
            cell.setResultTime(time: timeOperation)
        
        default: break
        }
    }
    
    fileprivate func appendCells(){
        numberCells += 12
        arrayCollectionView.reloadData()
    }
}
