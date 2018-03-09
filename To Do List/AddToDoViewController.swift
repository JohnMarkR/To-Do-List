//
//  AddToDoViewController.swift
//  To Do List
//
//  Created by John Roquemore on 3/4/18.
//  Copyright © 2018 John Roquemore. All rights reserved.
//

import UIKit
import CoreData

class AddToDoViewController: UIViewController
{
    @IBOutlet weak var toDoItem: UITextField!
    
    var homeView = ListTableViewController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func addTapped(_ sender: UIButton)
    {
        let todo = ToDo()
        todo.textItem = toDoItem.text!
        homeView.toDoItems.append(todo)
        homeView.tableView.reloadData()
        
        navigationController?.popViewController(animated: true)

    }
}
