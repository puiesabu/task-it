//
//  ViewController.swift
//  TaskIt
//
//  Created by Kaeli Lo on 29/9/14.
//  Copyright (c) 2014 Kaeli Lo. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let manageObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName : UIFont(name: "AvenirNext-Heavy", size: 22),
            NSForegroundColorAttributeName: UIColor.whiteColor()
        ]
        
        fetchedResultController = getFetchedResultController()
        fetchedResultController.delegate = self
        fetchedResultController.performFetch(nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showTaskDetail") {
            let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let task = fetchedResultController.objectAtIndexPath(indexPath!) as TaskModel
            detailVC.detailTaskModel = task
        } else if (segue.identifier == "showTaskAdd") {
            let addVC: TaskAddViewController = segue.destinationViewController as TaskAddViewController
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
        return fetchedResultController.sections!.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultController.sections![section].numberOfObjects
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let task = fetchedResultController.objectAtIndexPath(indexPath) as TaskModel
        
        var cell: TaskCell
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
            cell.taskLabel.text = task.task
            cell.dateLabel.text = Date.toString(date: task.date)
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("yourCell") as TaskCell
            cell.taskLabel.text = task.task
            cell.dateLabel.text = Date.toString(date: task.date)
        }
    
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
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {

        var task = fetchedResultController.objectAtIndexPath(indexPath) as TaskModel
        if indexPath.section == 0 {
            task.completed = true
        } else {
            task.completed = false
        }
        
        (UIApplication.sharedApplication().delegate as AppDelegate).saveContext()
    }
    
    // NSFetchedResultControllerDelegate
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }

    // Helpers
    func taskFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "TaskModel")
        let completedSortDescriptor = NSSortDescriptor(key: "completed", ascending: true)
        let dateSortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [completedSortDescriptor, dateSortDescriptor]
        return fetchRequest
    }
    
    func getFetchedResultController() -> NSFetchedResultsController {
        fetchedResultController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: manageObjectContext, sectionNameKeyPath: "completed", cacheName: nil)
        return fetchedResultController
    }
}

