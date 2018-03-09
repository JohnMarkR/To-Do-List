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
    
    // Test create items
    var toDoItems: [ToDo] = []
    
    @IBOutlet weak var addTaskButton: UIBarButtonItem!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
  
        // Create the test ones
        toDoItems = testCreateTask()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let otherView = segue.destination as? AddToDoViewController
        {
            otherView.homeView = self
        }
        
        if let completedView = segue.destination as? DetailViewController
        {
            if let toDo = sender as? ToDo
            {
               completedView.selectedItem = toDo
            }
 
        }
        
    }

    func testCreateTask() -> [ToDo]
    {
        let call = ToDo()
        call.textItem = "Call dad today"
        
        let walk = ToDo()
        walk.textItem = "Walk the CAT"
        
        let test = ToDo()
        test.textItem = "Test the app"
        
        return [call, walk, test]
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
        cell.textLabel?.text = toDo.textItem

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let toDo = toDoItems[indexPath.row]
        performSegue(withIdentifier: "ToDetails", sender: toDo)
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
     {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
     }
     
     else if editingStyle == .insert
     {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath)
    {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
    {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */    
}
