//
//  Data.swift
//  TaskIt
//
//  Created by Kaeli Lo on 29/9/14.
//  Copyright (c) 2014 Kaeli Lo. All rights reserved.
//

import UIKit

func getIncomplemtedTasks() -> Array<TaskModel> {

    var tasks = [
        TaskModel(task: "Study French", date: Date.at(year: 2014, month: 10, day: 1), completed: false),
        TaskModel(task: "Dinner with Alex", date: Date.at(year: 2014, month: 10, day: 3), completed: false),
        TaskModel(task: "Nine West Sale", date: Date.at(year: 2014, month: 10, day: 4), completed: false)
    ]
    
    return tasks
}

func getComplemtedTasks() -> Array<TaskModel> {
    
    var tasks = [
        TaskModel(task: "Study TableView", date: Date.at(year: 2014, month: 9, day: 30), completed: true)
    ]
    
    return tasks
}