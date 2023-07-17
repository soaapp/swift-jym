//
//  AddGoalView.swift
//  SwiftJym
//
//  Created by Jay on 2023-07-17.
//

import SwiftUI
import CoreData

struct AddGoalView: View {
    
    
//    let persistenceController = PersistenceController.shared
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @Environment(\.scenePhase) var scenePhase
    
    @State private var title = ""
    @State private var weight = ""
    @State private var muscleGroup = ""
    @State private var goalDescription = ""
    @State private var goalMonth = 1
    @State private var goalYear = 2023
    @State private var isCompleted = false
    
    private let muscleGroups = ["All", "Chest", "Back", "Legs", "Shoulders", "Biceps", "Triceps"]
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Lifting Goal", text: $title)
                    TextField("Goal Weight", text: $weight)
                    
                    Picker("Muscle Group", selection: $muscleGroup){
                        ForEach(muscleGroups, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $goalDescription)
                    
                    Picker("Goal Month", selection: $goalMonth){
                        ForEach(1 ..< 13){
                            Text(String($0))
                        }
                    }
                    Picker("Goal Year", selection: $goalYear){
                        ForEach(2023 ..< 2040){
                            Text(String($0))
                        }
                    }
                } header: {
                    Text("Add goal date")
                }
                
                Section {
                    Button("Save"){
                        let newGoal = Goal(context: moc)
                        newGoal.id = UUID()
                        newGoal.title = title
                        newGoal.weight = weight
                        newGoal.muscleGroup = muscleGroup
                        newGoal.goalDescription = goalDescription
                        newGoal.goalMonth = Int16(goalMonth)
                        newGoal.goalYear = Int16(goalYear)
                        
                        try? moc.save()
                        dismiss()
                        //add the goal
                    }
                }
            }
            .navigationTitle("Add Gym Goal")
        }
    }
}

struct AddGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AddGoalView()
    }
}
