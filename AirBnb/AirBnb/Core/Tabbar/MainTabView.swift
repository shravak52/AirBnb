//
//  MainTabView.swift
//  AirBnb
//
//  Created by Shravak Jain on 26/10/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreView()
                .tabItem{Label("Explore", systemImage: "magnifyingglass")}
            wishlistView()
                .tabItem{Label("Wishlists", systemImage: "heart")}
            ProfileView()
                .tabItem{Label("Profile", systemImage: "person")}
        }
    }
}

#Preview {
    MainTabView()
}
