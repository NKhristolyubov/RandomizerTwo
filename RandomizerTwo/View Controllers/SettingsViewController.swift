//
//  SettingsViewController.swift
//  RandomizerTwo
//
//  Created by Николай Христолюбов on 11.10.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var minimumTF: UITextField!
    @IBOutlet weak var maximumTF: UITextField!
    
    var randomNumberSVC: RandomNumber!
    var delegate: SettingViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        minimumTF.text = String(randomNumberSVC.minimumValue)
        minimumTF.delegate = self
        maximumTF.text = String(randomNumberSVC.maximumValue)
        maximumTF.delegate = self
    }

    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        view.endEditing(true)
        delegate.setValue(for: randomNumberSVC)
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let value = textField.text else { return }
        guard let newValue = Int(value) else { return }
        if textField == minimumTF {
            randomNumberSVC.minimumValue = newValue
        } else {
            randomNumberSVC.maximumValue = newValue
        }
    }
}
