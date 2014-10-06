//
//  TaskAddViewController.swift
//  TaskIt
//
//  Created by Kaeli Lo on 29/9/14.
//  Copyright (c) 2014 Kaeli Lo. All rights reserved.
//

import UIKit
import CoreData

class TaskAddViewController: UIViewController {

    @IBOutlet weak var taskField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonDidPress(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addButtonDidPress(sender: UIButton) {
        let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        
        let manageObjectContext = appDelegate.managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("TaskModel", inManagedObjectContext: manageObjectContext!)
        let task = TaskModel(entity: entityDescription!, insertIntoManagedObjectContext: manageObjectContext!)
        task.task = taskField.text
        task.date = dueDatePicker.date
        task.completed = false
        appDelegate.saveContext()
        
        var request = NSFetchRequest(entityName: "TaskModel")
        var error: NSError? = nil
        
        var result: NSArray = manageObjectContext!.executeFetchRequest(request, error: &error)!
        
        for res in result {
            println(res)
        }

        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
