//
//  Exercise.swift
//  SwiftJym
//
//  Created by Andrea Rota on 11/7/23.
//

import Foundation
import SwiftUI

//struct Exercise: Identifiable, Hashable, Codable {
//
//    let id: String
//    let name: String
//    let force: String
//    let level: String
//    let mechanic: String
//    let equipment: String
//    let primaryMuscles: [String]
//    let secondaryMuscles: [String]
//    let instructions: String
//    let category: String
//
//    let imageName: String
////    var image: Image {
////        Image(imageName)
////    }
//
//}


// MARK: - Exercise
struct Exercise: Hashable, Codable, Identifiable {
    let id, name, force, level: String
    let mechanic, equipment: String
    let primaryMuscles, secondaryMuscles: [String]
    let instructions: [String]
    let category, imageName: String
}

//For testing and local development purposes
#if DEBUG
extension Exercise {
    
    static func trendingExample() -> [Exercise] {
        [
            Exercise(id: "1001", name: "Sumo Deadlift", force: "Pull", level: "Intermediate", mechanic: "Compound", equipment: "Barbell", primaryMuscles: ["Hamstrings"], secondaryMuscles: ["Lower Back", "Glutes"], instructions: ["Test Instructions for Bench Press"], category: "Weightlifting", imageName: "deadlift1"),
            Exercise(id: "1002", name: "Crunches", force: "Core", level: "Beginner", mechanic: "Accessory", equipment: "Bodyweight", primaryMuscles: ["Abs"], secondaryMuscles: ["Lower Abs"], instructions: ["Test Instructions for Bench Press"], category: "Core", imageName: "crunches1"),
            Exercise(id: "1003", name: "Bench Press", force: "Push", level: "Intermediate", mechanic: "Compound", equipment: "Barbell", primaryMuscles: ["Chest"], secondaryMuscles: ["Triceps"], instructions: ["Test Instructions for Bench Press"], category: "Weightlifting", imageName: "benchpress1")
        ]
    }
    
    static func recentExample() -> [Exercise] {
        [
            Exercise(id: "1001", name: "Sumo Deadlift", force: "Pull", level: "Intermediate", mechanic: "Compound", equipment: "Barbell", primaryMuscles: ["Hamstrings"], secondaryMuscles: ["Lower Back", "Glutes"], instructions: ["Test Instructions for Bench Press"], category: "Weightlifting", imageName: "deadlift1"),
            Exercise(id: "1002", name: "Crunches", force: "Core", level: "Beginner", mechanic: "Accessory", equipment: "Bodyweight", primaryMuscles: ["Abs"], secondaryMuscles: ["Lower Abs"], instructions: ["Test Instructions for Bench Press"], category: "Core", imageName: "crunches1"),
            Exercise(id: "1003", name: "Bench Press", force: "Push", level: "Intermediate", mechanic: "Compound", equipment: "Barbell", primaryMuscles: ["Chest"], secondaryMuscles: ["Triceps"], instructions: ["Test Instructions for Bench Press"], category: "Weightlifting", imageName: "benchpress1")
        ]
    }
    
    static func allExercisesExample() -> [Exercise] {
        [
            Exercise(id: "1001", name: "Sumo Deadlift", force: "Pull", level: "Intermediate", mechanic: "Compound", equipment: "Barbell", primaryMuscles: ["Hamstrings"], secondaryMuscles: ["Lower Back", "Glutes"], instructions: ["Test Instructions for Sumo Deadlift"], category: "Weightlifting", imageName: "deadlift1"),
            Exercise(id: "1002", name: "Crunches", force: "Core", level: "Beginner", mechanic: "Accessory", equipment: "Bodyweight", primaryMuscles: ["Abs"], secondaryMuscles: ["Lower Abs"], instructions: ["Test Instructions for Crunches"], category: "Core", imageName: "crunches1"),
            Exercise(id: "1003", name: "Bench Press", force: "Push", level: "Intermediate", mechanic: "Compound", equipment: "Barbell", primaryMuscles: ["Chest"], secondaryMuscles: ["Triceps"], instructions: ["Test Instructions for Bench Press"], category: "Weightlifting", imageName: "benchpress1")
            
        ]
    }
}
#endif
