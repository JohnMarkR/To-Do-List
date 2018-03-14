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
    
    var item = [ToDoList]()
    
    @IBOutlet weak var toDoItem: UITextField!
    
    var homeView = ListTableViewController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func addTapped(_ sender: UIButton)
    {
//        let todo = ToDo()
//        todo.textItem = toDoItem.text!
//        homeView.toDoItems.append(todo)
//        homeView.tableView.reloadData()
//
//        navigationController?.popViewController(animated: true)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ToDoList", in: context)
        let listItem = NSManagedObject(entity: entity!, insertInto: context)
        
        listItem.setValue(toDoItem.text!, forKey: "toDoItem")
      
        appDelegate.saveContext()
        self.item.append(listItem as! ToDoList)
        print(item)
        print(toDoItem)
        
        
        homeView.tableView.reloadData()
        navigationController?.popViewController(animated: true)

    }
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoList")
        
        do
        {
            let results = try managedContext.fetch(fetchRequest)
            item = results as! [NSManagedObject] as! [ToDoList]
        }
            
        catch let error as NSError
        {
            print("Fetching Error: \(error.userInfo)")
        }
    }

}














