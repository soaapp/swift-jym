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
    private let muscleGroups = ["All", "Chest", "Back", "Shoulders", "Biceps", "Triceps"]
    
    var body: some View {
        ZStack {
            Color(white: 0.95)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                AppBarView()
                
                TagLineView()
                    .padding()
                
                SearchAndScanView()
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0 ..< muscleGroups.count) { i in
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
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width:30, height:30)
                    .padding()
            }
            
            
            
            
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    
    
    var body: some View {
        Text("Find what moves ")
            .font(.custom("Futura", size: 28))
        + Text("you.")
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
