//
//  ExerciseDetailsView.swift
//  SwiftJym
//
//  Created by Jay on 2023-07-21.
//

import SwiftUI

struct ExerciseDetailsView: View {
    var exercise: Exercise
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    Image(exercise.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    DescriptionView(exercise: exercise)
                        .offset(y: -45)
                }
                .edgesIgnoringSafeArea(.top)
                
                
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    CustomBackButtonView(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image(systemName:"ellipsis")
            )
        
    }
}

struct ExerciseDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetailsView(exercise: exercises[0])
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct DescriptionView: View {
    let exercise: Exercise
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text(exercise.name)
                    .font(.title)
                .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {}, label:  {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 35)
                        .padding(.trailing)
                        .foregroundColor(.red)
                        .fontWeight(.bold)
                })
            }
            
            HStack (spacing: 4) {
                ForEach(0 ..< 5) { item in
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                }
                
                HStack{
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
                    
                }
                .padding(.leading)
                
                Spacer()
                
                
                
            }
            
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Text("Details")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("Force: \(exercise.force.capitalized)")
                        .opacity(0.6)
                    Text("Mechanic: \(exercise.mechanic.capitalized)")
                        .opacity(0.6)
                    Text("Equipment: \(exercise.equipment.capitalized)")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack (alignment: .leading) {
                    Text("Muscle Groups")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("Primary Muscle: \(exercise.primaryMuscles.joined(separator: ",").capitalized)")
                        .opacity(0.6)
                    Text("Secondary Muscles: \(exercise.secondaryMuscles.joined(separator: ",").capitalized)")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding(.vertical)
            
            Text("Instructions")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text("\(exercise.instructions.joined(separator: " "))")
                .lineSpacing(6.0)
                .opacity(0.6)
            
            
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(40.0)
    }
}

struct CustomBackButtonView: View {
    let action: ()-> Void
    
    var body: some View {
        Button(action: action, label: {
            Image(systemName: "chevron.backward")
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8)
                .foregroundColor(.black)
        })
    }
}
