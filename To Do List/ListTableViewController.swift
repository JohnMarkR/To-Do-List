//
//  ListTableViewController.swift
//  To Do List
//
//  Created by John Roquemore on 3/3/18.
//  Copyright © 2018 John Roquemore. All rights reserved.
//

import UIKit
import CoreData

class ListTableViewController: UITableViewController
{
    var toDoItems: [ToDoList] = []
    
    @IBOutlet weak var addTaskButton: UIBarButtonItem!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        getToDoItems()
        tableView.reloadData()
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        if let otherView = segue.destination as? AddToDoViewController
        {
            otherView.homeView = self
        }
        
        if let completedView = segue.destination as? DetailViewController
        {
            if let toDo = sender as? ToDoList
            {
               completedView.selectedItem = toDo
               completedView.homeView = self
            }
 
        }
        
    }
    
    func getToDoItems()
    {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoList")

        do
        {
            let results = try managedContext.fetch(fetchRequest)
            toDoItems = results as! [ToDoList]
            print(toDoItems)
        }

        catch let error as NSError
        {
            print("Fetching Error: \(error.userInfo)")
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return toDoItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let toDo = toDoItems[indexPath.row]
        cell.textLabel?.text = toDo.value(forKey: "toDoItem") as? String
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let toDo = toDoItems[indexPath.row]
        performSegue(withIdentifier: "ToDetails", sender: toDo)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        let movedObject = self.toDoItems[sourceIndexPath.row]
        toDoItems.remove(at: sourceIndexPath.row)
        toDoItems.insert(movedObject, at: destinationIndexPath.row)
        self.tableView.reloadData()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool)
    {
        super.setEditing(editing, animated: animated)
        
        if editing
        {
            tableView.setEditing(true, animated: true)
        }
        
        else
        {
            tableView.setEditing(false, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            toDoItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
