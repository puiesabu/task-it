//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Kaeli Lo on 29/9/14.
//  Copyright (c) 2014 Kaeli Lo. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    var mainVC: ViewController!
    var detailTaskModel: TaskModel!

    @IBOutlet weak var taskField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        taskField.text = detailTaskModel.task
        dueDatePicker.date = detailTaskModel.date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonDidPress(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func doneButtonDidPress(sender: UIBarButtonItem) {
        var task = TaskModel(task: taskField.text, date: dueDatePicker.date, completed: detailTaskModel.completed)
        
        mainVC.allTasks[0][mainVC.tableView.indexPathForSelectedRow()!.row] = task
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}
