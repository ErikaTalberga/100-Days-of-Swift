//
//  ViewController.swift
//  Project2
//
//  Created by erika.talberga on 30/01/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Guess the flag!"
        addCountries()
        setupButtons()
        addScoreButton()
        askQuestion(action: nil)
    }
    
    func addCountries() {
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    }
    
    func setupButtons() {
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func addScoreButton() {
        let showScoreButton = UIBarButtonItem(title: "Show score", style: .plain, target: self, action: #selector(showAlert))
        navigationItem.rightBarButtonItem = showScoreButton
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let alertController = UIAlertController(title: title, message: "Your score is: \(score)!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(alertController, animated: true)
    }
    @objc func showAlert() {
        let scoreAlert = UIAlertController(title: "Your score:", message: "\(score)", preferredStyle: .actionSheet)
        scoreAlert.addAction(UIAlertAction(title: "Continue", style: .default))
        present(scoreAlert, animated: true)
    }
    
}

