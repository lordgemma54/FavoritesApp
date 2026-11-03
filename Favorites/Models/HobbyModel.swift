//
//  HobbyModel.swift
//  Favorites
//
//  Created by rahul v on 11/3/26.
//

import Foundation

struct HobbyModel : Identifiable {
    let id: Int
    let hobbyName: String
    let hobbyIcon: String
    var isFavorite: Bool = false
}
