//
//  AppTabView.swift
//  Crypto-IOS
//
//  Created by user272164 on 4/12/25.
//
import SwiftUI

struct AppTabView:View {
    var body: some View {
        TabView{
            Tab("Home", systemImage: "house"){
                AssetList()
                    .navigationTitle("Home")
            }
            Tab("Favourities", systemImage: "star"){
                FavouritiesView()
            }
            
            Tab("Settings", systemImage: "gear"){
                SettingsView()
            }
        }
    }
}

#Preview{
    AppTabView()
}

