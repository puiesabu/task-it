//
//  TaskModel.swift
//  TaskIt
//
//  Created by Kaeli Lo on 6/10/14.
//  Copyright (c) 2014 Kaeli Lo. All rights reserved.
//

import Foundation
import CoreData

@objc(TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var task: String
    @NSManaged var date: NSDate
    @NSManaged var completed: NSNumber

}
