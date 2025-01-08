//
//  ListingDetailView.swift
//  AirBnb
//
//  Created by Shravak Jain on 25/10/24.
//

import SwiftUI
import MapKit


struct ListingDetailView: View {
    @Environment(\.dismiss) var dismiss
    let listing : Listing
    @State private var cameraPosition : MapCameraPosition
    
    init(listing: Listing){
        self.listing = listing
        let region = MKCoordinateRegion(
            center: listing.city == "Los Angeles" ? .losAngeles : .miami,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .topLeading){
                ListingImageCarouseView(listing: listing)
                    .frame(height: 269)
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }
            }
            VStack(alignment: .leading, spacing: 8){
                Text(listing.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading){
                    
                    HStack(spacing: 2){
                        Image(systemName: "star.fill")
                        Text("\(listing.raiting)")
                        Text("-")
                        
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .font(.caption)
                    .foregroundStyle(.black)
                    
                    Text("\(listing.city), \(listing.state)")
                    
                }
                .font(.caption)
            }.padding(.leading)
            .frame(maxWidth: .infinity,alignment: .leading)
            
            Divider()
            
            //hostInfoView
            HStack{
                VStack(alignment: .leading, spacing: 4){
                    Text("Entire \(listing.type.description) Hosted by \(listing.ownerName) ")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    HStack(spacing: 2){
                        Text("\(listing.numberOfGuests) guests")
                        Text("\(listing.numberOfBedrooms) Bedroom")
                        Text("\(listing.numberOfBeds) Beds")
                        Text("\(listing.numberOfBathrooms) Baths")
                    }
                    .font(.caption)
                        
                }
                .frame(width: 300,alignment: .leading )
                
                Spacer()
                Image(listing.ownerImageUrls)
                    .resizable()
                    .frame(width: 64, height: 64)
                
            }.padding()
            
            Divider()
             //Listing Features
            
            VStack(alignment: .leading, spacing: 16){
                ForEach(listing.features){feature in
                    HStack{
                        Image(systemName: feature.imagesName)
                        VStack(alignment: .leading){
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                    
                }
            }
            .padding()
            
            Divider()
            //bedroomView
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll sleep")
                    .font(.headline)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 16){
                        ForEach(1...listing.numberOfBedrooms, id: \.self){bedroom in
                            VStack{
                                Image(systemName: "bed.double")
                                
                                Text("Bedroom  \(bedroom)")
                            }.frame(width: 122, height: 100)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 1)
                                        .foregroundStyle(.gray)
                                    
                                }
                        }
                    }
                }.scrollTargetBehavior(.paging)
            }
            .padding()
            
            Divider()
            
             //Listing amenities
            
            VStack(alignment: .leading, spacing: 16){
                Text("What this place offers")
                    .font(.headline)
                    
                ForEach(listing.amenities){ amenity in
                    HStack{
                        Image(systemName: amenity.imageName)
                            .frame(width: 35)
                        Text(amenity.title)
                            .font(.footnote)
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll be")
                    .font(.headline)
                
                Map(position: $cameraPosition)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom){
            VStack{
                Divider()
                    .padding(.bottom)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("\(listing.priceForNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before texes")
                            .font(.footnote)
                        
                        Text("Jan 6 - 24")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    Spacer()
                    
                    Button{
                        
                    } label :{
                        Text("Reserved")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal,32)
            }.background(.white)
        }
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listing[3])
}
