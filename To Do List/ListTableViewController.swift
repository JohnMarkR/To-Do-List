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
    
    var task = [ToDoList]()
    
    // Test create items
    var toDoItems: [ToDo] = []
    
    @IBOutlet weak var addTaskButton: UIBarButtonItem!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        // Create the test ones
        toDoItems = testCreateTask()
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoList")
        
        do
        {
            let results = try managedContext.fetch(fetchRequest)
            task = results as! [ToDoList]
        }
            
        catch let error as NSError
        {
            print("Fetching Error: \(error.userInfo)")
        }
    }


}
