//
//  JymHomePage.swift
//  SwiftJym
//
//  Created by Jay on 2023-07-05.
//

import SwiftUI

struct JymHomePage: View {
    
    //TODO: featuredExercises and recentExercises should never be empty. Add null check.
    private let featuredExercises = Exercise.featuredExercises()
    private let recentExercises = Exercise.recentExercises()
    
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
                                
                                
                                Text("Featured")
                                    .font(.custom("Futura-Medium", size: 25))
                                    .padding()
                                
                                
                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(featuredExercises) { item in
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
                                                    ExerciseCardView(exercise: item, size: 150)
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
            .environmentObject(ExerciseModelData())
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
                //                Placeholder star rating
                //                ForEach(0 ..< 5) { item in
                //                    Image(systemName: "star.fill")
                //                        .foregroundColor(.yellow)
                
                
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
                Text(exercise.level.capitalized)
                    .opacity(0.5)
    
                
                Spacer()
                
                if(exercise.force == "push"){
                    Image(systemName: "arrow.up")
                        .foregroundColor(.yellow)
                } else if(exercise.force == "pull") {
                    Image(systemName: "arrow.down")
                        .foregroundColor(.yellow)
                } else {
                    Image(systemName: "arrow.down.right.and.arrow.up.left")
                        .foregroundColor(.yellow)
                }
                Text(exercise.force.capitalized)
                    .opacity(0.5)
                
            }
            .lineLimit(1)
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}
