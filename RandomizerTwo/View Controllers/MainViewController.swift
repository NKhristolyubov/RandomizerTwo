//
//  ViewController.swift
//  RandomizerTwo
//
//  Created by Николай Христолюбов on 11.10.2022.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setValue(for randomNumber: RandomNumber)
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    @IBOutlet weak var randomNumberLabel: UILabel!
    
    private var randomNumber = RandomNumber(minimumValue: 0, maximumValue: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minimumValueLabel.text = String(randomNumber.minimumValue)
        maximumValueLabel.text = String(randomNumber.maximumValue)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else {return}
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else {return}
        settingsVC.randomNumberSVC = randomNumber
        settingsVC.delegate = self
    }

    @IBAction func getRandomButtonPressed(_ sender: UIButton) {
        randomNumberLabel.text = String(randomNumber.getRandom)
    }
    
}

extension MainViewController: SettingViewControllerDelegate {
    func setValue(for randomNumber: RandomNumber) {
        minimumValueLabel.text = String(randomNumber.minimumValue)
        maximumValueLabel.text = String(randomNumber.maximumValue)
        self.randomNumber = randomNumber
       
    }
    
    
}
