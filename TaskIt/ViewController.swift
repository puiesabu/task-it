//
//  ViewController.swift
//  TaskIt
//
//  Created by Kaeli Lo on 29/9/14.
//  Copyright (c) 2014 Kaeli Lo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks: Array<TaskModel> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = getData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        tasks = tasks.sorted {
            (task1: TaskModel, task2: TaskModel) -> Bool in
            // comparsion logic here
            return task1.date.timeIntervalSince1970 < task2.date.timeIntervalSince1970
        }
        
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showTaskDetail") {
            let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let task = tasks[indexPath!.row]
            detailVC.detailTaskModel = task
            detailVC.mainVC = self
        } else if (segue.identifier == "showTaskAdd") {
            let addVC: TaskAddViewController = segue.destinationViewController as TaskAddViewController
            addVC.mainVC = self
        }
    }

    @IBAction func addButtonDidPress(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("showTaskAdd", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let task: TaskModel = tasks[indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        cell.taskLabel.text = task.task
        cell.dateLabel.text = Date.toString(date: task.date)
    
        return cell
    }
    
    // UITAbleViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }

}

