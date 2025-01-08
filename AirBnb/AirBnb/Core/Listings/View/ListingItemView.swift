//
//  ListingItemView.swift
//  AirBnb
//
//  Created by Shravak Jain on 25/10/24.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    var body: some View {
        VStack(spacing: 2){
            //images
            
            ListingImageCarouseView(listing: listing)
                .frame(height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack(alignment: .top){
                //Details
                VStack(alignment: .leading){
                    Text("\(listing.city)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text("\(listing.address)")
                        .foregroundStyle(.gray)
                    
                    Text("Jan 6 -24")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4){
                        Text("\(listing.priceForNight)")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    
                }
                Spacer()
                
                //Rating
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                    Text("\(listing.raiting)")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listing[0])
}
