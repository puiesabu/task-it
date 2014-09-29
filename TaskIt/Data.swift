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
        TaskModel(task: "Study French", date: "1/10/2014"),
        TaskModel(task: "Dinner with Alex", date: "3/10/2014"),
        TaskModel(task: "Nine West Sale", date: "4/10/2014")
    ]
    
    return data
}