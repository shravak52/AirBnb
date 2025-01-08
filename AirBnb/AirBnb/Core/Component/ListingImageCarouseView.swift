//
//  ListingImageCarouseView.swift
//  AirBnb
//
//  Created by Shravak Jain on 25/10/24.
//

import SwiftUI

struct ListingImageCarouseView: View {
    let listing: Listing
    var body: some View {
        TabView(){
            ForEach(listing.imageUrls, id: \.self){ image in
                Image(image)
                    .resizable()
                    .scaledToFit()
            }
        }
          
            .tabViewStyle(.page)
        
    }
}

#Preview {
    ListingImageCarouseView(listing: DeveloperPreview.shared.listing[0])
}
