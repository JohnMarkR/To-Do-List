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
    var selectedItem: ToDoList?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.title = "Completed"
        itemLabel.text = selectedItem?.toDoItem
        
    }

    @IBAction func itemCompleted(_ sender: Any)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        if let toDoListItems = selectedItem
        {
            managedContext.delete(toDoListItems)
            navigationController?.popViewController(animated: true)
        }        
    }
}
