//
//  ProfileOptionView.swift
//  AirBnb
//
//  Created by Shravak Jain on 26/10/24.
//

import SwiftUI

struct ProfileOptionView: View {
    let imageName : String
    let title : String
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                
                Text(title)
                    .font(.subheadline)
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            
            Divider()
            
        }
    }
}

#Preview {
    ProfileOptionView(imageName: "gear", title: "Settings")
}
