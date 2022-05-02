//
//  TableViewController.swift
//  web_english
//
//  Created by Shao Hua Lee on 4/5/22.
//

import UIKit


//Tab 2
class TableViewController: UITableViewController {
    
    
    @IBOutlet var TableView1: UITableView!
    
    
    //@IBOutlet weak var TableViewCell1: UITableViewCell!
    
    var animalArray = ["cat", "dog", "elephant", "rabbit"]
    var fruitArray = ["apple", "orange", "grape", "banana"]
    
    override func numberOfSections(in TableView1: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ TableView1: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return animalArray.count
        }
        else if section == 1 {
            return fruitArray.count
            
        }
        return 0
        
    }
    
    override func tableView(_ TableView1: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView1.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = animalArray[indexPath.row]
            print("section 0")
        }
        else if indexPath.section == 1 {
            cell.textLabel?.text = fruitArray[indexPath.row]
            print("section 1")
        }
        
        return cell
    }

    

}


