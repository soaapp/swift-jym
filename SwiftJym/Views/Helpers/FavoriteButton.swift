//
//  FavoriteButton.swift
//  SwiftJym
//
//  Created by Jay on 2023-07-28.
//

import SwiftUI

struct FavoriteButton: View {
    
    @EnvironmentObject var exerciseModelData : ExerciseModelData
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
                    isSet.toggle()
                } label: {
                    Label("Toggle Favorite", systemImage: isSet ? "heart.fill" : "heart")
                        .labelStyle(.iconOnly)
                        .foregroundColor(isSet ? .red : .gray)
                }
        
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
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
            .environmentObject(exerciseModelData)
    }
}
