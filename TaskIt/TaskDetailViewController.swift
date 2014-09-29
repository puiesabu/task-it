//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Kaeli Lo on 29/9/14.
//  Copyright (c) 2014 Kaeli Lo. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
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
    
}
