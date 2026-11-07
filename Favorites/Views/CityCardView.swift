//
//  CityCardView.swift
//  Favorites
//
//  Created by rahul v on 11/3/26.
//

import SwiftUI

struct CityCardView: View {
    
    let city : CityModel
    @EnvironmentObject private var favorites : FavoritesViewModel
    
    var body: some View {
//        Used google to help with improper sizing caused by these cityCards. I believe the images were causing each HStack in the ScrollView in FavoritesView to be wider than the screen and I was losing the icons and the heart buttons for the books and hobbies sections. Geometry reader fixed this issue after trying several other solutions
        GeometryReader { geometry in
            ZStack (alignment: .bottom) {
                Image(city.cityImage)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height
                    )
                    .clipped()
                
                HStack {
                    Text(city.cityName)
                        .font(.system(size:18, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(6)
                        .background(Color.black.opacity(0.35))
                    
                    Spacer()
                    
                    Button(action: {
                        favorites.toggleFavoriteCity(city: city)
                    }) {
                        Image(systemName: city.isFavorite ? "heart.fill" : "heart")
                            .padding(6)
                            .foregroundStyle(city.isFavorite ? .red : .white)
                            .background(Color.black.opacity(0.35))
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 10)
                
            }
            .shadow(radius: 3)
        }
        .frame(height: 140)
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    CityCardView(city: CityModel(id: 1, cityName: "Amsterdam", cityImage: "amsterdam", isFavorite: false))
}
