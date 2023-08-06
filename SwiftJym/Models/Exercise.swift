//
//  Exercise.swift
//  SwiftJym
//
//  Created by Andrea Rota on 11/7/23.
//

import Foundation
import SwiftUI

// MARK: - Exercise
struct Exercise: Hashable, Codable, Identifiable {
    let id: Int
    let name, level: String
    let force, mechanic, equipment: String
    let primaryMuscles, secondaryMuscles: [String]
    let instructions: [String]
    let category, imageName: String
    var isFavorite, isFeatured, isRecent: Bool
}


#if DEBUG
extension Exercise {
    

    static func recentExercises() -> [Exercise] {
        
        var recentExercises = [Exercise]()
        
        for index in 0..<ExerciseModelData().exercises.count {
            if(ExerciseModelData().exercises[index].isRecent){
                recentExercises.append(ExerciseModelData().exercises[index])
            }
        }
        
        return recentExercises
    }
    
    
    static func featuredExercises() -> [Exercise] {
        
        var featuredExercises = [Exercise]()
        
        for index in 0..<ExerciseModelData().exercises.count {
            if(ExerciseModelData().exercises[index].isFeatured){
                featuredExercises.append(ExerciseModelData().exercises[index])
            }
        }
        
        return featuredExercises
    }
    
    
    static func allExercises() -> [Exercise] {
        
        var allExercises = [Exercise]()
        
        for index in 0..<ExerciseModelData().exercises.count {
            allExercises.append(ExerciseModelData().exercises[index])
        }
        
        return allExercises
    }
    
    static func muscleGroupsList() -> [String] {
        
        var muscleGroupList = ["All", "Abdominals", "Abductors", "Adductors", "Middle Back", "Lower Back", "Biceps", "Calves", "Chest", "Forearms", "Glutes", "Hamstrings", "Lats", "Neck", "Quadricepts", "Shoulders", "Traps", "Triceps"]
        
        return muscleGroupList
    }
    
}
#endif
