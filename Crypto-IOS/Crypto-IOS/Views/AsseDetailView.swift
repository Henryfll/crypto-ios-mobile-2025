//
//  AsseDetailView.swift
//  Crypto-IOS
//
//  Created by user272164 on 4/12/25.
//
import SwiftUI

struct AssetDetailView: View {
    
    let asset:Asset
    
    var body: some View {
        Text(asset.name)
            .navigationTitle(asset.name)
    }
}
#Preview{
    NavigationStack{
        AssetDetailView(asset: .init(id: "bitcoin", name: "Bitcoin", symbol: "BTC", priceUsd:"121321.1212", changePercent24Hr: "2.36"))
    }
}
