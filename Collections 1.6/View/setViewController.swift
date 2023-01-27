//
//  setViewController.swift
//  Collections 1.6
//
//  Created by YURA																			 on 26.01.2023.
//

import UIKit

class setViewController: UIViewController {
    
    static let ident = "setViewController"
    private let set = Setmatching()
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
    @IBOutlet weak var labelUniqueFirstTF: UILabel!
    @IBOutlet weak var labelNotMatching: UILabel!
    @IBOutlet weak var labelAllMatching: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTextField.delegate = self
        secondTextField.delegate = self
        
    }
    
    @IBAction func allMatcinng(_ sender: UIButton) {
        guard let text1 = firstTextField.text, let text2 = secondTextField.text else {return}
        let resultMatching = set.allMtchingLetters(text1: text1, text2: text2)
        labelAllMatching.text = resultMatching
    }
    
    @IBAction func notMatching(_ sender: UIButton) {
        guard let text1 = firstTextField.text, let text2 = secondTextField.text else {return}
        let resultMatching = set.noMtchingLetters(text1: text1, text2: text2)
        labelNotMatching.text = resultMatching
    }
    
    @IBAction func uniqueCharactersFirstTF(_ sender: UIButton) {
        guard let text1 = firstTextField.text, let text2 = secondTextField.text else {return}
        let resultMatching = set.uniqueFirstTFLetters(text1: text1, text2: text2)
        labelUniqueFirstTF.text = resultMatching
    }
}

extension setViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return set.onlyLetters(text: updatedText)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstTextField {
            secondTextField.becomeFirstResponder()
        } else {
            view.endEditing(true)
        }
        return true
    }
}
