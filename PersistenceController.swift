//
//  PersistenceController.swift
//  SwiftJym
//
//  Created by Jay on 2023-07-17.
//

import Foundation
import CoreData

struct PersistenceController: {
    // A singleton for our entire app to use
    static let shared = PersistenceController()

    // Storage for Core Data
    let container: NSPersistentContainer

    // A test configuration for SwiftUI previews
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)

        // Create 10 example programming languages.
        for _ in 0..<3 {
            let goal = Goal(context: controller.container.viewContext)
            
            goal.title = "example goal 1"
            goal.weight = "example weight 1"
            goal.muscleGroup = ""
            goal.goalDescription = ""
            goal.goalYear = 2023
            goal.goalMonth = 1
            
        }

        return controller
    }()

    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "GymGoalsDataModel")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
                print("SUCCESS: Created goal and stored with Core Data.")
            } catch {
                print("ERROR: Creating goal was unsuccessful.")
            }
        }
    }
}


