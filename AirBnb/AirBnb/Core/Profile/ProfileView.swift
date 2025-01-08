//
//  ProfileView.swift
//  AirBnb
//
//  Created by Shravak Jain on 26/10/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            // Profile Login view
            VStack(alignment: .leading, spacing: 32){
                VStack(alignment: .leading, spacing: 8) {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("Login to start planning your next trip")
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
                HStack{
                    Text("Don't have an account ?")
                    
                    Text("Sign Up")
                        .fontWeight(.semibold)
                        .underline()
                    
                }.font(.caption)
            }
            //profile option
            VStack(spacing: 24){
                ProfileOptionView(imageName: "gear", title: "Settings")
                ProfileOptionView(imageName: "gear", title: "Accessibility")
                ProfileOptionView(imageName: "questionmark.circle", title: "Visit the help center")
            }
            .padding(.vertical)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
