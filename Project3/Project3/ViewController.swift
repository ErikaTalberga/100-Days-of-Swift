//
//  ViewController.swift
//  Project3
//
//  Created by erika.talberga on 29/01/2024.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        addImage()
        pictures.sort()
        print(pictures)
    }
    
    func addImage() {
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        do {
            let items = try fileManager.contentsOfDirectory(atPath: path)
            for item in items {
                if item.hasPrefix("nssl") {
                    pictures.append(item)
                }
            }
        } catch {
            print("Error: \(error)")
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "detail") as? DetailViewController {
            viewController.selectedImage = pictures[indexPath.row]
            viewController.selectedPictureNumber = indexPath.row
            viewController.totalPictures = pictures.count
            navigationController?.pushViewController(viewController, animated: true)
        }
    }

}
