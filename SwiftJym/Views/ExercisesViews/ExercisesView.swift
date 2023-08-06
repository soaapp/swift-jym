//
//  ExercisesView.swift
//  SwiftJym
//
//  Created by Andrea Rota on 12/7/23.
//

import SwiftUI

struct ExercisesView: View {
    
    @EnvironmentObject var exerciseModelData : ExerciseModelData
    
    @State private var selectedMuscleGroup: Int = 0
    @State private var showFavoritesOnly = false
    @State private var searchText = ""
    
    ///Muscle Group categories
    private let muscleGroups = Exercise.muscleGroupsList()
    
    ///All exercises list generated from Exercise.swift
    private let allExercises = Exercise.allExercises()
    
    
    var filteredResults: [Exercise] {
        
        if searchText.isEmpty {
            return exerciseModelData.exercises.filter{ exercise in
                (!showFavoritesOnly || exercise.isFavorite)
                 }
        } else {
            return exerciseModelData.exercises.filter{ exercise in
                ((!showFavoritesOnly || exercise.isFavorite) && exercise.name.contains(searchText))
                
            }
        }
    }
    
//    var selectedExercises: [Exercise] {
//        exerciseModelData.exercises.filter{exercise in
//
//        }
//    }
    
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
                        
                        ForEach(filteredResults) { exercise in
                            NavigationLink(destination: ExerciseDetailsView(exercise: exercise)) {
                                ExerciseRow(exercise: exercise, filter: muscleGroups[selectedMuscleGroup])
                            }
                        }
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
    var filter: String
    
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
