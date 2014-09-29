//
//  Data.swift
//  TaskIt
//
//  Created by Kaeli Lo on 29/9/14.
//  Copyright (c) 2014 Kaeli Lo. All rights reserved.
//

import UIKit

func getData() -> Array<TaskModel> {

    var data = [
        TaskModel(task: "Study French", date: Date.at(year: 2014, month: 10, day: 1)),
        TaskModel(task: "Dinner with Alex", date: Date.at(year: 2014, month: 10, day: 3)),
        TaskModel(task: "Nine West Sale", date: Date.at(year: 2014, month: 10, day: 4))
    ]
    
    return data
}