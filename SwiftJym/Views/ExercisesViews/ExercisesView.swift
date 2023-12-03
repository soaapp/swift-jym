//
//  ExercisesView.swift
//  SwiftJym
//
//  Created by Andrea Rota on 12/7/23.
//

import SwiftUI
import Foundation
import os


struct ExercisesView: View {
    
    @EnvironmentObject var exerciseModelData : ExerciseModelData
    
    @State private var selectedMuscleGroup: Int = 0
    @State private var showFavoritesOnly = false
    @State private var searchText = ""
    
    var activeFilter = false
    
    ///Muscle Group categories
    private let muscleGroups = Exercise.muscleGroupsList()
    
    ///All exercises list generated from Exercise.swift
    private let allExercises = Exercise.allExercises()
    
    
    var filteredResults: [Exercise] {
        //TODO: Clean up these if checks and turn into func
        if searchText.isEmpty {
            
            
            if(selectedMuscleGroup == 0){
                return exerciseModelData.exercises.filter{ exercise in
                    ((!showFavoritesOnly || exercise.isFavorite) )
                }
            }
            return exerciseModelData.exercises.filter{ exercise in
                ((!showFavoritesOnly || exercise.isFavorite) && exercise.primaryMuscles.contains(muscleGroups[selectedMuscleGroup].lowercased()))
                
            }
            
        } else {
            
            if(selectedMuscleGroup == 0){
                return exerciseModelData.exercises.filter{ exercise in
                    ((!showFavoritesOnly || exercise.isFavorite) && exercise.name.contains(searchText))
                }
            }
            return exerciseModelData.exercises.filter{ exercise in
                ((!showFavoritesOnly || exercise.isFavorite) && exercise.name.contains(searchText) && exercise.primaryMuscles.contains(muscleGroups[selectedMuscleGroup].lowercased()))
                
            }
        }
    }

    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
//                    AppBarView()
                    
                    ExerciseListTagLineView()
                        .padding()
                    
                    //SearchAndScanView()
                    
//                    let _ = print("group index: \(selectedMuscleGroup) and group: \(muscleGroups[selectedMuscleGroup])")
                    let _ = print("group:\(muscleGroups[selectedMuscleGroup])")
                    
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
                    Toggle(isOn: $showFavoritesOnly){
                        Text("Favorites Only")
                            .font(.custom("Futura", size: 18))
                        
                    }
                    .padding(.horizontal)
                    
                    
                        Text("Exercises")
                            .font(.custom("Futura-Medium", size: 25))
                            .padding(.horizontal)
                        
                        
                    List{
//                        if(selectedMuscleGroup != 0){
                            ForEach(filteredResults) { exercise in
                                NavigationLink(destination: ExerciseDetailsView(exercise: exercise)) {
                                    ExerciseRow(exercise: exercise)
                                }
                            }
//                        } else {
//                            ForEach(allExercises) { exercise in
//                                NavigationLink(destination: ExerciseDetailsView(exercise: exercise)) {
//                                    ExerciseRow(exercise: exercise)
//                                }
//                            }
//                        }
                        
                    }
                }
            }
        }
        .searchable(text: $searchText)
        
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static let exerciseModelData = ExerciseModelData()
    
    static var previews: some View {
        ExercisesView()
            .environmentObject(exerciseModelData)
    }
}

struct ExerciseListTagLineView: View {
    var body: some View {
        Text("Find what moves ")
            .font(.custom("Futura", size: 25))
        + Text("you.")
            .font(.custom("Futura-Bold", size: 25))
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
        HStack {
            if(exercise.level == "beginner"){
                Image(systemName: "1.circle.fill")
                    .foregroundColor(.green)
            } else if(exercise.level == "intermediate"){
                Image(systemName: "2.circle.fill")
                    .foregroundColor(.orange)
            } else {
                Image(systemName: "3.circle.fill")
                    .foregroundColor(.red)
            }
            Text(exercise.name)
            
            Spacer()
            
            if exercise.isFavorite {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
        }
        .lineLimit(1)
    }
}
