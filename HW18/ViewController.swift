//
//  ViewController.swift
//  HW18
//
//  Created by Павел on 05.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var occupationTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBAction func sessionButtonDidTap(_ sender: UIButton) {
        guard let model = modelSettings() else {
            return
        }
        
        APIService.postDataBySession(model: model) { [weak self] responseString in
            
            DispatchQueue.main.async{
                self?.presentAlert(text: responseString)
            }
            
            
        }
    }
    @IBAction func alamofireButtonDidTap(_ sender: UIButton) {
        guard let model = modelSettings() else {
            return
        }
        
        APIService.postDataByAlamofire(model: model) { [weak self] responseString in
            self?.presentAlert(text: responseString)
        }
    }
    
    func presentAlert(text: String) {
        let alert = UIAlertController(title: "Attention", message: text, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .destructive)
        alert.addAction(defaultAction)
        self.present(alert, animated: true)
    }
    
    func modelSettings() -> UserModel? {
        guard let birthString = birthTextField.text,
              let birth = Int(birthString),
              let occupation = occupationTextField.text,
              let name = nameTextField.text,
              let lastname = lastNameTextField.text,
              let country = countryTextField.text else {
            return nil
        }
        let model = UserModel(birth: birth,
                              occupation: occupation,
                              name: name,
                              lastname: lastname,
                              country: country)
        return model
    }
    
}
