//
//  TaskAddViewController.swift
//  TaskIt
//
//  Created by Kaeli Lo on 29/9/14.
//  Copyright (c) 2014 Kaeli Lo. All rights reserved.
//

import UIKit

class TaskAddViewController: UIViewController {

    var mainVC: ViewController!
    
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
        var task = TaskModel(task: taskField.text, date: dueDatePicker.date)
        mainVC.tasks.append(task)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
