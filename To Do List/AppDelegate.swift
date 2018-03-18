//
//  AppDelegate.swift
//  To Do List
//
//  Created by John Roquemore on 3/3/18.
//  Copyright © 2018 John Roquemore. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate
{
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        let splitViewController = self.window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        splitViewController.delegate = self

        return true
    }

    func applicationWillTerminate(_ application: UIApplication)
    {
        self.saveContext()
    }
    
    // MARK: - Split View Controller
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool
    {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return true }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return true }
        if topAsDetailController.selectedItem == nil
        {
            return true
        }
        return true
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer =
        {
            let container = NSPersistentContainer(name: "To_Do_List")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError?
            {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext ()
    {
        let context = persistentContainer.viewContext
        if context.hasChanges
        {
            do
            {
                try context.save()
            }
            
            catch
            {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

