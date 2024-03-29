//
//  UISetup.swift
//  Project8
//
//  Created by erika.talberga on 11/02/2024.
//

import UIKit

extension ViewController {
    
    func setupUI() {
        setupScoreLabel()
        setupCluesLabel()
        setupAnswersLabel()
        setupCurrentAnswerTextField()
        setupButtonsView()
        setupButtons()

        addConstraints()
    }
    
    //    MARK: - Setting up UI

        func setupScoreLabel() {
            scoreLabel = UILabel()
            scoreLabel.translatesAutoresizingMaskIntoConstraints = false
            scoreLabel.textAlignment = .right
            scoreLabel.text = "Score: 0"
            view.addSubview(scoreLabel)
        }
        
        func setupCluesLabel() {
            cluesLabel = UILabel()
            cluesLabel.translatesAutoresizingMaskIntoConstraints = false
            cluesLabel.font = UIFont.systemFont(ofSize: 24)
            cluesLabel.text = "CLUES"
            cluesLabel.numberOfLines = 0
            cluesLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
            view.addSubview(cluesLabel)
        }
        
        func setupAnswersLabel() {
            answersLabel = UILabel()
            answersLabel.translatesAutoresizingMaskIntoConstraints = false
            answersLabel.font = UIFont.systemFont(ofSize: 24)
            answersLabel.text = "ANSWERS"
            answersLabel.numberOfLines = 0
            answersLabel.textAlignment = .right
            answersLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
            view.addSubview(answersLabel)
        }
        
        func setupCurrentAnswerTextField() {
            currentAnswer = UITextField()
            currentAnswer.translatesAutoresizingMaskIntoConstraints = false
            currentAnswer.placeholder = "Tap letters to guess"
            currentAnswer.textAlignment = .center
            currentAnswer.font = UIFont.systemFont(ofSize: 44)
            currentAnswer.isUserInteractionEnabled = false
            view.addSubview(currentAnswer)
        }
        
        func setupButtons() {
            submit.translatesAutoresizingMaskIntoConstraints = false
            submit.setTitle("SUBMIT", for: .normal)
            view.addSubview(submit)

            clear.translatesAutoresizingMaskIntoConstraints = false
            clear.setTitle("CLEAR", for: .normal)
            view.addSubview(clear)
        }
        
        func setupButtonsView() {
            buttonsView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(buttonsView)
        }
        
    //    MARK: - Constraints
        
        func addConstraints() {
            NSLayoutConstraint.activate([
                scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
                scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
                
                cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
                cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
                cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: -100),
                
                answersLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
                answersLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100),
                answersLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100),
                answersLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor),
                
                currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
                currentAnswer.topAnchor.constraint(equalTo: cluesLabel.bottomAnchor, constant: 20),
                
                submit.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor, constant: 20),
                submit.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
                submit.heightAnchor.constraint(equalToConstant: 44),

                clear.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
                clear.centerYAnchor.constraint(equalTo: submit.centerYAnchor),
                clear.heightAnchor.constraint(equalToConstant: 44),
                
                buttonsView.widthAnchor.constraint(equalToConstant: 750),
                buttonsView.heightAnchor.constraint(equalToConstant: 320),
                buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                buttonsView.topAnchor.constraint(equalTo: submit.bottomAnchor, constant: 20),
                buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20)
            ])
            
            let width = 150
            let height = 80

            for row in 0..<4 {
                for col in 0..<5 {
             
                    let letterButton = UIButton(type: .system)
                    letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)

                    letterButton.setTitle("WWW", for: .normal)

                    let frame = CGRect(x: col * width, y: row * height, width: width, height: height)
                    letterButton.frame = frame

                    buttonsView.addSubview(letterButton)
                    letterButtons.append(letterButton)
                    letterButton.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
                }
            }
        }
}
