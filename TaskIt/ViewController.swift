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
    
    var allTasks: [[TaskModel]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allTasks = [getIncomplemtedTasks(), getComplemtedTasks()]
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        allTasks[0] = allTasks[0].sorted {
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
            let task = allTasks[indexPath!.section][indexPath!.row]
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
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return allTasks.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTasks[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let task: TaskModel = allTasks[indexPath.section][indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        cell.taskLabel.text = task.task
        cell.dateLabel.text = Date.toString(date: task.date)
    
        return cell
    }
    
    // UITAbleViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "TO DO"
        } else {
            return "Completed"
        }
    }

}

