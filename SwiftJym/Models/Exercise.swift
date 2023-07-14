//
//  Exercise.swift
//  SwiftJym
//
//  Created by Andrea Rota on 11/7/23.
//

import Foundation

struct Exercise: Identifiable {
    
    let id = UUID()
    let name: String
    let image: String // TODO: check if an array is needed or 1:1
    let muscleGroups: [String]
}

#if DEBUG
extension Exercise {
    
    static func trendingExample() -> [Exercise] {
        [
            Exercise(name: "Sumo Deadlift", image: "deadlift1", muscleGroups: ["All"]),
            Exercise(name: "Bench Press", image: "benchpress1", muscleGroups: ["All"]),
            Exercise(name: "Squat", image: "squat1", muscleGroups: ["All", "Legs"])
        ]
    }
    
    static func recentExample() -> [Exercise] {
        [
            Exercise(name: "Crunches", image: "crunches1", muscleGroups: ["All"]),
            Exercise(name: "Seated Row", image: "seatedrow1", muscleGroups: ["All"]),
            Exercise(name: "Dumbbell Curl", image: "dumbbellcurl1", muscleGroups: ["All"]),
            Exercise(name: "Hammer Curl", image: "hammercurl1", muscleGroups: ["All"]),
            Exercise(name: "Tricep Dip", image: "tricepdip1", muscleGroups: ["All"])
        ]
    }
    
    static func allExercisesExample() -> [Exercise] {
        [
            Exercise(name: "Crunches", image: "crunches1", muscleGroups: ["All"]),
            Exercise(name: "Seated Row", image: "seatedrow1", muscleGroups: ["All"]),
            Exercise(name: "Dumbbell Curl", image: "dumbbellcurl1", muscleGroups: ["All"]),
            Exercise(name: "Hammer Curl", image: "hammercurl1", muscleGroups: ["All"]),
            Exercise(name: "Tricep Dip", image: "tricepdip1", muscleGroups: ["All"]),
            Exercise(name: "Squat", image: "squat1", muscleGroups: ["All", "Legs"]),
            Exercise(name: "Hammer Curl", image: "hammercurl1", muscleGroups: ["All"]),
            Exercise(name: "Hammer Curl", image: "hammercurl1", muscleGroups: ["All"])
        ]
    }
}
#endif
