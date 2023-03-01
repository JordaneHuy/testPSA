//
//  AddCityViewController.swift
//  psatest
//
//  Created by Jordane HUY on 28/02/2023.
//

import UIKit

class AddCityViewController: UIViewController {
    @IBOutlet weak var searchLocationTextField: UITextField!
    
    var viewModel: AddCityViewModel = AddCityViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchLocationTextField.delegate = self
        searchLocationTextField.addTarget(self, action: #selector(doSearchLocation), for: .editingDidEnd)
    }
    
    @objc func doSearchLocation() {
        guard let searchValue = searchLocationTextField.text, !searchValue.isEmpty else {
            return
        }
        
        viewModel.searchLocation(searchStr: searchValue)
    }
}

extension AddCityViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
         return true
    }
}
