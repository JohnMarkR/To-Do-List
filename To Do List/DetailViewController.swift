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

    @IBAction func itemCompleted(_ sender: UIButton)
    {
        print("inside itemCompleted")
        
        var indexOfArray = 0
        for todo in homeView.toDoItems
        {
            print("inside the for loop")
            
            if todo.textItem == selectedItem.textItem
            {
                homeView.toDoItems.remove(at: indexOfArray)
                print("We got it \(todo.textItem)")
                homeView.tableView.reloadData()
                navigationController?.popViewController(animated: true)
                break
            }
            indexOfArray += 1
        }
    }
}
