//
//  ExploreView.swift
//  AirBnb
//
//  Created by Shravak Jain on 25/10/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    var body: some View {
        NavigationStack{
            if showDestinationSearchView{
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
            }
            else{
                ScrollView{
                    Search_Filterbar(location: $viewModel.searchLocation)
                        .onTapGesture {
                            withAnimation(.snappy){
                                showDestinationSearchView.toggle()
                            }
                        }
                    
                    LazyVStack(spacing: 2){
                        ForEach(viewModel.listings){ listing  in
                            NavigationLink(value: listing){
                                ListingItemView(listing: listing)
                                    .cornerRadius(10)
                                    .frame(height: 400)
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .toolbar(.hidden)
                        .ignoresSafeArea()
                }
            }
                
        }
    }
}

#Preview {
    ExploreView()
}
