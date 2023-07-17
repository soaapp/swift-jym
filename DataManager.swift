//
//  DataManager.swift
//  SwiftJym
//
//  Created by Jay on 2023-07-17.
//

import Foundation
import CoreData

class DataManager: NSObject, ObservableObject {
    /// Dynamic properties that the UI will react to
    @Published var goalItems: [Goal] = [Goal]()
    
    /// Add the Core Data container with the model name
    let container: NSPersistentContainer = NSPersistentContainer(name: "GymGoalsDataModel")
    
    /// Default init method. Load the Core Data container
    override init() {
        super.init()
        container.loadPersistentStores { _, _ in }
    }
}
