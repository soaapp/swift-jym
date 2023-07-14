//
//  JymHomePage.swift
//  SwiftJym
//
//  Created by Jay on 2023-07-05.
//

import SwiftUI

struct JymHomePage: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedMuscleGroup: Int = 0
    //Workout categories
    private let muscleGroups = ["All", "Chest", "Back", "Shoulders", "Biceps", "Triceps"]
    
    private let trendingExercises = Exercise.trendingExample() // FIXME: injected an example array for preview/debug purpose
    private let recentExercises = Exercise.recentExample() // FIXME: same as trendingExercises
    
    var body: some View {
        TabView {
            ZStack {
                Color(white: colorScheme == .light ? 0.95 : 0.1)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        AppBarView()
                        
                        TagLineView()
                            .padding()
                        
                        
                        Text("Trending")
                            .font(.custom("Futura-Medium", size: 25))
                            .padding()
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(trendingExercises) { item in
                                    ExerciseCardView(exercise: item, size: 200)
                                }
                                .padding(.trailing)
                            }
                            .padding(.horizontal)
                        }
                        
                        Text("Recent")
                            .font(.custom("Futura-Medium", size: 25))
                            .padding()
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(recentExercises) { item in
                                    ExerciseCardView(exercise: item, size: 180)
                                }
                                .padding(.trailing)
                            }
                            .padding(.horizontal)
                        }
                        .padding(.bottom)
                    }
                }
            }
            .tabItem {
                Label("Dashboard", systemImage: "house")
            }
            
            ExercisesView()
                .tabItem {
                    Label("Exercises", systemImage: "figure.cross.training")
                }
            
            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "chart.xyaxis.line")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct JymHomePage_Previews: PreviewProvider {
    static var previews: some View {
        JymHomePage()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "menucard.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width:20, height:30)
                    .padding()
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "bell.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width:25, height:30)
                    .padding()
            }
            
            
            
            
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    
    
    var body: some View {
        Text("Let's get to ")
            .font(.custom("Futura", size: 28))
        + Text("work.")
            .font(.custom("Futura-Bold", size: 28))
            .foregroundColor(.blue)
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
            .background(Color.white)
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
                .foregroundColor(isActive ? .black : .gray)
            
            
            if (isActive) {
                Color(.black)
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ExerciseCardView: View {
    let exercise: Exercise
    let size: CGFloat
    
    var body: some View {
        VStack {
            Image(exercise.image)
                .resizable()
                .scaledToFit()
                .frame(width: size, height: 200 * (size/200))
                .cornerRadius(40)
            
            Text(exercise.name)
                .font(.title3)
                .fontWeight(.bold)
            
            HStack (spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                
                Spacer()
                
                Image(systemName: "3.lane")
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}
