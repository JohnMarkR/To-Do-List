//
//  DetailViewController.swift
//  To Do List
//
//  Created by John Roquemore on 3/6/18.
//  Copyright © 2018 John Roquemore. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController
{
    @IBOutlet weak var itemLabel: UILabel!
    
    var homeView = ListTableViewController()
    var selectedItem = ToDo()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        itemLabel.text = selectedItem.textItem
    }

    @IBAction func itemCompleted(_ sender: Any)
    {
        print("inside itemCompleted")
        
        var indexOfArray = 0
        
        for toDo in homeView.toDoItems
        {
            print("inside the for loop")
            
            if toDo.textItem == selectedItem.textItem
            {
                homeView.toDoItems.remove(at: indexOfArray)
                print("We got it \(toDo.textItem)")
                homeView.tableView.reloadData()
                navigationController?.popViewController(animated: true)
                break
            }
            indexOfArray += 1
        }
        print("out of button code")
    }
}
