//
//  TableViewController.swift
//  web_english
//
//  Created by Shao Hua Lee on 4/5/22.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    @IBOutlet var TableView1: UITableView!
    
    
    //@IBOutlet weak var TableViewCell1: UITableViewCell!
    
    var animalArray = ["cat", "dog", "elephant", "rabbit"]
    
    override func numberOfSections(in TableView1: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ TableView1: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return animalArray.count
        }
        else if section == 1 {
            return 2
            
        }
        return 8
        
    }
    
    override func tableView(_ TableView1: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView1.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = animalArray[indexPath.row]
        return cell
    }

    

}


