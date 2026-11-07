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
        GeometryReader { geometry in
            ZStack (alignment: .bottom) {
                Image(city.cityImage)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height
                    )
                //                .frame(maxWidth: .infinity) // added for testing
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
            //        .frame(maxWidth: .infinity) // added for testing
            //        .clipped() // added for testing
            .shadow(radius: 3)
        }
        .frame(height: 140)
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    CityCardView(city: CityModel(id: 1, cityName: "Amsterdam", cityImage: "amsterdam", isFavorite: false))
}
