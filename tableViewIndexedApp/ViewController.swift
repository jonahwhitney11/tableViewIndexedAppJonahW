//
//  ViewController.swift
//  tableViewIndexedApp
//
//  Created by Jonah Whitney on 2/28/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var petTable: UITableView!
    
    let petArray = [["Mammals", "Dog", "Cat", "Rabbit", "Mouse", "Rat"], ["Birds", "Parakeet", "Finch", "Parrot", "Eagle"], ["Fish", "Tropical Fish", "Goldfish", "Sea Horse"], ["Reptiles", "Turtle", "Lizard", "Snake"]]
    
    let indexArray = ["🐶M", "🦆B", "🐠F", "🐢R"]
    
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        petTable.dataSource = self
        petTable.delegate = self
        petTable.sectionIndexColor = UIColor.white
        petTable.sectionIndexBackgroundColor = UIColor.black
        petTable.sectionIndexTrackingBackgroundColor = UIColor.darkGray
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petArray[section].count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellID")
        }
        cell?.textLabel?.text = petArray[indexPath.section][indexPath.row + 1]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = petArray[indexPath.section][indexPath.row + 1]
        let alert = UIAlertController(title: "Your Choice", message: "\(selectedItem)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in
        })
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return petArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return petArray[section][0]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return indexArray
    }
    
}

