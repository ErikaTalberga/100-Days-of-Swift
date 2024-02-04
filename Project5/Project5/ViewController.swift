//
//  ViewController.swift
//  Project5
//
//  Created by erika.talberga on 02/02/2024.
//

import UIKit

class ViewController: UITableViewController {
    
    var allWords = [String]()
    var usedWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promtForAnswer))
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        startGame()
    }
    
    func startGame() {
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    @objc func promtForAnswer() {
        let alertController = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        alertController.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak alertController] action in
            guard let answer = alertController?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        alertController.addAction(submitAction)
        present(alertController, animated: true)
    }
    
    func submit(_ answer: String) {
        
    }


}

