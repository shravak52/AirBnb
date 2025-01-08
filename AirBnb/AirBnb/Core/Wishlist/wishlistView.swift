//
//  wishlistView.swift
//  AirBnb
//
//  Created by Shravak Jain on 26/10/24.
//

import SwiftUI

struct wishlistView: View {
    var body: some View {
        NavigationStack{
            
            VStack(alignment: .leading, spacing: 32){
                VStack(alignment: .leading, spacing: 4){
                    Text("Login to view your wishlist")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text("You can create, view, or edit wishlists once you've logged in")
                        .font(.footnote)
                }
                
                Button{
                    print("login")
                }label:{
                    Text("Login")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlists")
        }
    }
}

#Preview {
    wishlistView()
}
