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
    
    var task = [ToDoList]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func addTapped(_ sender: UIButton)
    {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ToDoList", in: context)
        
        let taskItem = ToDoList(entity: entity!, insertInto: context)
        taskItem.toDoItem = toDoItem.text
        
        appDelegate.saveContext()
        task.append(taskItem)
        
        //self.tableView.reloadData()
        
        
    }
    // TODO: - Need Keyboard code to make it exit.

}
