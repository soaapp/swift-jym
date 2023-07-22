//
//  ExerciseDetailsView.swift
//  SwiftJym
//
//  Created by Jay on 2023-07-21.
//

import SwiftUI

struct ExerciseDetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    Image("deadlift1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    DescriptionView()
                        .offset(y: -40)
                }
                .edgesIgnoringSafeArea(.top)
                
                HStack {
                    Text("Add to Favourites")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: {}, label:  {
                        Image(systemName: "heart")
                            .padding()
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(10.0)
                            .foregroundColor(.red)
                            .fontWeight(.bold)
                    })
                }
                .padding()
                .padding(.horizontal)
                .background(Color("Primary"))
                .cornerRadius(50, corners: .topLeft)
                .frame(maxHeight: .infinity, alignment: .bottom)
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    CustomBackButtonView(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image(systemName:"ellipsis")
            )
        
    }
}

struct ExerciseDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetailsView()
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
    var body: some View {
        VStack (alignment: .leading) {
            Text("Sumo Deadlift")
                .font(.title)
                .fontWeight(.bold)
            
            HStack (spacing: 4) {
                ForEach(0 ..< 5) { item in
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                }
                Text("Advanced")
                    .opacity(0.5)
                    .padding(.leading, 8)
                
                Spacer()
                
            }
            
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Text("Details")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("Force: Pull")
                        .opacity(0.6)
                    Text("Mechanic: Compound")
                        .opacity(0.6)
                    Text("Equipment: Barbell")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack (alignment: .leading) {
                    Text("Muscle Groups")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("Primary Muscle: Hamstrings")
                        .opacity(0.6)
                    Text("Secondary Muscles: Glutes, Lower Back ")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding(.vertical)
            
            Text("Instructions")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text("Begin with a bar loaded on the ground. Approach the bar so that the bar intersects the middle of the feet. The feet should be set very wide, near the collars. Bend at the hips to grip the bar. The arms should be directly below the shoulders, inside the legs, and you can use a pronated grip, a mixed grip, or hook grip. Relax the shoulders, which in effect lengthens your arms.Take a breath, and then lower your hips, looking forward with your head with your chest up. Drive through the floor, spreading your feet apart, with your weight on the back half of your feet. Extend through the hips and knees.As the bar passes through the knees, lean back and drive the hips into the bar, pulling your shoulder blades together. Return the weight to the ground by bending at the hips and controlling the weight on the way down.")
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
