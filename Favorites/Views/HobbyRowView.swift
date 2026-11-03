//
//  HobbyRowView.swift
//  Favorites
//
//  Created by rahul v on 11/3/26.
//

import SwiftUI

struct HobbyRowView: View {

    let hobby : HobbyModel
    @EnvironmentObject private var favorites : FavoritesViewModel
    
    var body: some View {
        HStack {
            Text(hobby.hobbyIcon)
                .font(.title2)
            Text(hobby.hobbyName)
                .font(.body)
            
            Spacer()
            
            Button(action: {
                favorites.toggleFavoriteHobby(hobby: hobby)
            }) {
                Image(systemName: hobby.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(hobby.isFavorite ? .red : .gray)
//                    .padding(6)
//                    .foregroundStyle(hobby.isFavorite ? .red : .white)
//                    .background(Color.black.opacity(0.35))
            }
        }
    }
}

#Preview {
    HobbyRowView(hobby: HobbyModel(id: 1, hobbyName: "Hiking", hobbyIcon: "🥾"))
}
