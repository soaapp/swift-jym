//
//  ExercisesView.swift
//  SwiftJym
//
//  Created by Andrea Rota on 12/7/23.
//

import SwiftUI

struct ExercisesView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedMuscleGroup: Int = 0
    //Workout categories
    private let muscleGroups = ["All", "Chest", "Back", "Legs", "Shoulders", "Biceps", "Triceps"]
    
    private let allExercises = Exercise.allExercisesExample() // FIXME: injected an example array for preview/debug purpose
    
    var body: some View {
        
        ZStack {
            Color(white: colorScheme == .light ? 0.95 : 0.1)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                AppBarView()
                
                ExerciseListTagLineView()
                    .padding()
                
                SearchAndScanView()
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0 ..< muscleGroups.count, id: \.self) { i in
                            MuscleGroupView(isActive: i == selectedMuscleGroup, muscleGroup: muscleGroups[i])
                                .onTapGesture {
                                    selectedMuscleGroup = i
                                }
                        }
                    }
                    .padding()
                }
                
                Text("Exercises")
                    .font(.custom("Futura-Medium", size: 25))
                    .padding()
                
                List(allExercises) { item in
                    ExerciseRow(exercise: item)
                }
                .ignoresSafeArea(.all)
            }
        }
        
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}

struct ExerciseListTagLineView: View {
    var body: some View {
        Text("Find what moves ")
            .font(.custom("Futura", size: 20))
        + Text("you.")
            .font(.custom("Futura-Bold", size: 20))
            .foregroundColor(.blue)
    }
}

struct ExerciseRow: View {
    var exercise: Exercise
    
    var body: some View {
        Text(exercise.name)
    }
}
