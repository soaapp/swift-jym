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
    private let muscleGroups = ["All", "Chest", "Back", "Shoulders", "Biceps", "Triceps"]
    
    var body: some View {
        
        ZStack {
            Color(white: colorScheme == .light ? 0.95 : 0.1)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
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
                    
                    
                }
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
