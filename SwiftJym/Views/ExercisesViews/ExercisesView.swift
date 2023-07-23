//
//  ExercisesView.swift
//  SwiftJym
//
//  Created by Andrea Rota on 12/7/23.
//

import SwiftUI

struct ExercisesView: View {
    
    @State private var selectedMuscleGroup: Int = 0
    //Workout categories
    private let muscleGroups = ["All", "Chest", "Back", "Legs", "Shoulders", "Biceps", "Triceps"]
    
    private let allExercises = Exercise.allExercisesExample() // FIXME: injected an example array for preview/debug purpose
    
    var body: some View {
        
        ZStack {
            Color("Bg")
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
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScanView: View {
    @State private var search: String = ""
    
    var body: some View {
        HStack{
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.trailing, 8)
                TextField("Search exercises", text: $search)
            }
            .padding(.all, 15)
            .background(Color("bg"))
            .cornerRadius(6)
            .padding(.horizontal,1)
            
            Button(action: {}) {
                Image(systemName: "camera")
            }
            
            
        }
        .padding(.horizontal)
    }
}

struct MuscleGroupView: View {
    let isActive: Bool
    let muscleGroup: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(muscleGroup)
                .font(.system(size:20))
                .fontWeight(.medium)
                .foregroundColor(isActive ? .primary : .secondary)
            
            
            if (isActive) {
                Color.primary
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ExerciseRow: View {
    var exercise: Exercise
    
    var body: some View {
        Text(exercise.name)
    }
}
