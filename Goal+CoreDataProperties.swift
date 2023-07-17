//
//  Goal+CoreDataProperties.swift
//  SwiftJym
//
//  Created by Jay on 2023-07-17.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var weight: String?
    @NSManaged public var muscleGroup: String?
    @NSManaged public var goalMonth: Int16
    @NSManaged public var goalYear: Int16
    @NSManaged public var goalDescription: String?

}

extension Goal : Identifiable {

}
