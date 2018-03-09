//
//  DetailViewController.swift
//  To Do List
//
//  Created by John Roquemore on 3/6/18.
//  Copyright © 2018 John Roquemore. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController

{
    
    @IBOutlet weak var itemLabel: UILabel!
    
    var todo: ToDo?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if let detailItem = self.todo
        {
            itemLabel.text = detailItem.textItem
        }

    }

}
