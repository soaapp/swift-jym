//
//  SwiftJymApp.swift
//  SwiftJym
//
//  Created by Jay on 2023-07-05.
//

import SwiftUI

@main
struct SwiftJymApp: App {
    
    @StateObject private var manager: DataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
                .environment(\.managedObjectContext, manager.container.viewContext)
        }
    }
}
