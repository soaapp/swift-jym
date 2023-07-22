//
//  JymHomePage.swift
//  SwiftJym
//
//  Created by Jay on 2023-07-05.
//

import SwiftUI

struct JymHomePage: View {
    
    @State private var selectedMuscleGroup: Int = 0
    //Workout categories
    private let muscleGroups = ["All", "Chest", "Back", "Legs", "Shoulders", "Biceps", "Triceps"]
    
    //TODO: Should not be hard coded array values like this. Should be dynamically changing depending on if value is "trending" or "recently" tapped from the Exercises list
    private let trendingExercises = [exercises[0], exercises[1], exercises[2]]
    private let recentExercises = [exercises[4], exercises[5], exercises[1], exercises[6], exercises[7]]
    
    var body: some View {
        NavigationView {
            ZStack {
                TabView {
                    ZStack {
                        Color("Bg")
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
                                            NavigationLink(
                                                destination: ExerciseDetailsView(exercise: item),
                                                label: {
                                                    ExerciseCardView(exercise: item, size: 200)
                                                })
                                                .navigationBarHidden(true)
                                                .foregroundColor(.black)
                                            
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
                                            NavigationLink(
                                                destination: ExerciseDetailsView(exercise: item),
                                                label: {
                                                    ExerciseCardView(exercise: item, size: 200)
                                                })
                                                .navigationBarHidden(true)
                                                .foregroundColor(.black)
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
                    
                    GoalView()
                        .tabItem {
                            Label("Goals", systemImage: "medal.fill")
                        }
                }
            }
            .navigationBarBackButtonHidden(true)
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

struct ExerciseCardView: View {
    let exercise: Exercise
    let size: CGFloat
    
    var body: some View {
        VStack {
            Image(exercise.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: size, height: 200 * (size/200))
                .cornerRadius(40)
            
            Text(exercise.name)
                .font(.title3)
                .fontWeight(.bold)
                .lineLimit(1)
            
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
