//
//  ProfileView.swift
//  SwiftJym
//
//  Created by Andrea Rota on 12/7/23.
//

import SwiftUI
import CoreData

struct GoalView: View {
    
    @EnvironmentObject var manager: DataManager
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var goals: FetchedResults<Goal>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                List {
                    ForEach(goals) { item in
                        Label(item.title ?? "No Title", systemImage: "medal\(item.isCompleted ? ".fill" : "")")
                            .frame(maxWidth: .infinity, alignment: .leading).contentShape(Rectangle())
                            .onTapGesture {
                                item.isCompleted = !item.isCompleted
                            }
                    }
                    .onDelete(perform: removeGoal)
                }
                
                .navigationTitle("Gym Goals")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button {
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Goal", systemImage:"plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddGoalView()
                }
            }
        }
    }
    
    func removeGoal(at deletes: IndexSet) {
        for index in deletes {
            let goal = goals[index]
            moc.delete(goal)
        }
        try? moc.save()
    }
    
    //FIX ME: Preview is unable to run when CoreData is implemented. Simulation and real iOS device both work.
    struct GoalView_Previews: PreviewProvider {
        static var previews: some View {
            GoalView()
        }
    }
}

