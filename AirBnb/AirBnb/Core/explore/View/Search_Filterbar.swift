//
//  Search_Filterbar.swift
//  AirBnb
//
//  Created by Shravak Jain on 25/10/24.
//

import SwiftUI

struct Search_Filterbar: View {
    @Binding var location: String
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            VStack(alignment: .leading, spacing: 2){
                Text(location.isEmpty ? "Where to ?": location)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("\(location.isEmpty ? "Anywhere -" : "" ) Any Week - Add guests")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "line.horizontal.3.decrease.circle")
            })
            .foregroundStyle(.black)
        }
        .padding(.horizontal)
        .padding(.vertical,10)
            .overlay{
                Capsule()
                    .stroke(lineWidth:0.5)
                    .foregroundStyle(Color(.systemGray4))
                    .shadow(color: .black.opacity(0.4) , radius: 2)
                }
            .padding()
            }
    }

#Preview {
    Search_Filterbar(location: .constant("Los Angeles"))
}
