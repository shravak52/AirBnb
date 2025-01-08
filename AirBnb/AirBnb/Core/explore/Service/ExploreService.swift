//
//  ExploreService.swift
//  AirBnb
//
//  Created by Shravak Jain on 26/10/24.
//

import Foundation
class ExploreService{
    func fetchListings() async throws -> [Listing]{
        return DeveloperPreview.shared.listing
    }
}
