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
        toDoItem.becomeFirstResponder()

    }

    @IBAction func addTapped(_ sender: UIButton)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ToDoList", in: context)
        let listItem = NSManagedObject(entity: entity!, insertInto: context)
        
        listItem.setValue(toDoItem.text!, forKey: "toDoItem")
      
        appDelegate.saveContext()
        navigationController?.popViewController(animated: true)
    }
    
}
