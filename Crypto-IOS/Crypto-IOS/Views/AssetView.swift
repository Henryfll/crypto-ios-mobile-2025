//
//  AssetView.swift
//  Crypto-IOS
//
//  Created by user272164 on 4/11/25.
//

import SwiftUI

struct AssetViewState{
    let asset : Asset
    init(_ asset: Asset){
        self.asset = asset
    }
    
    var percentageColor: Color {
       percentage >= 0 ? .green: .gray
    }
    var percentage:Double{
        Double(asset.changePercent24Hr) ?? 0
    }
    
    var formatedPrice: String{
        String(format: "%.2f",Double(asset.priceUsd) ?? 0)
    }
    
    var formatedPercentage: String{
        String(format: "%.2f",Double(asset.changePercent24Hr) ?? 0)
    }
    
    var iconUrl: URL?{
        URL(string: "https://assets.coincap.io/assets/icons/\(asset.symbol.lowercased())@2x.png")
    }
}

struct AssetView:View {
    //let asset: Asset
    let assetViewState:AssetViewState
    
    var body: some View {
        Grid{
            GridRow{
                AsyncImage(url: assetViewState.iconUrl) {
                    image in image.resizable()
                }placeholder: {
                    Image(systemName: "dollarsign.gauge.chart.lefthalf.righthalf")
                }.frame(width: 40, height: 40)
                
                VStack(alignment: .leading){
                    Text(assetViewState.asset.symbol)
                        .font(.headline)
                    Text(assetViewState.asset.name)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Spacer()
                
                Text("\(assetViewState.formatedPercentage)%")
                    .foregroundStyle(assetViewState.percentageColor)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("$\(assetViewState.formatedPrice)")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

#Preview {
    AssetView(
        assetViewState: .init(
            .init(
                id: "bitcoin",
                name: "Bitcoin",
                symbol: "BTC",
                priceUsd: "8454",
                changePercent24Hr: "8.87"
            )
        )
    )
}
