//
//  AddCityViewController.swift
//  psatest
//
//  Created by Jordane HUY on 28/02/2023.
//

import UIKit
import OpenWeather

protocol AddCityViewControllerDelegate {
    func didAddCity(city: Location)
}

class AddCityViewController: UIViewController {
    @IBOutlet weak var searchLocationTextField: UITextField!
    
    var viewModel: AddCityViewModel = AddCityViewModel()
    var delegate: AddCityViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchLocationTextField.delegate = self
        searchLocationTextField.addTarget(self, action: #selector(doSearchLocation), for: .editingDidEnd)
    }
    
    @objc func doSearchLocation() {
        guard let searchValue = searchLocationTextField.text, !searchValue.isEmpty else {
            return
        }
        
        viewModel.searchLocation(searchStr: searchValue) { [weak self] location in
            self?.delegate?.didAddCity(city: location)
        }
    }
}

extension AddCityViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
         return true
    }
}
