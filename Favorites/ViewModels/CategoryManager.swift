//
//  CategoryManager.swift
//  Favorites
//
//  Created by rahul v on 11/6/26.
//

import Foundation

class CategoryManager<T: Favoritable> {
    //    unique for each category so each categories favorites are saved separately in UserDefaults
    private let storageKey : String
    
    //    this helps each categoryManager instance know where to read and write its data to / from
    init(storageKey : String) {
        self.storageKey = storageKey
    }
    
    
    func toggleFavorite(items: inout [T], targetItem: T) {
        if let index = items.firstIndex(where: { $0.id == targetItem.id}) {
            items[index].isFavorite.toggle()
            let favoriteIds = items.filter({ $0.isFavorite }).map { $0.id }
            
            saveFavoriteIds(ids: favoriteIds)
        }
    }
    
    
    //    stores favorite ids for each category in the category manager
    func saveFavoriteIds(ids: [Int]) {
        UserDefaults.standard.set(ids, forKey: storageKey)
    }
    
    
    //    filtering
    func filteredItem(items: [T], searchText: String) -> [T  ] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter {
                $0.searchableText.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    
    //    loads favorite ids when app starts so favorites persist
    func loadFavoriteIds() -> [Int] {
        return UserDefaults.standard.array(forKey: storageKey) as? [Int] ?? []
    }
    
    
    func initializeFavorites(items: [T]) -> [T] {
        let savedIds = loadFavoriteIds()
        //        creates a copy of the items array called updatedItem and adds any new favorites to this new array inside the loop
        return items.map { item in
            var updatedItem = item
            updatedItem.isFavorite = savedIds.contains(item.id)
            return updatedItem
        }
    }
    
    
    //    clears all favorites (sets all isFavorites flags to false) and removes the saveFavoriteIds from UserDefaults
    func clearFavorites(items: inout [T]) {
        for index in items.indices{
            items[index].isFavorite = false
        }
        UserDefaults.standard.removeObject(forKey: storageKey)
        
    }
}
