//
//  DetailsView.swift
//  SwiftJym
//
//  Created by Jay on 2023-07-21.
//

import SwiftUI

struct DetailsView: View {
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

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}


