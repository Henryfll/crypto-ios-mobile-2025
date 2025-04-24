//
//  AsseDetailView.swift
//  Crypto-IOS
//
//  Created by user272164 on 4/12/25.
//
import SwiftUI

struct AssetDetailView: View {
    
 @State var viewModel: AssetDetailsViewModel
    
    var body: some View {
        VStack{
            Text(viewModel.asset.name)
            Button {
                viewModel.addToFavourities()
            }label:{
                Text("Add to favourites")
            }
        }
        .navigationTitle(viewModel.asset.name)
        .alert(
            viewModel.errorMessage ?? "",
            isPresented: $viewModel.showError ){
                Button("OK"){
                    
                }
            }
        
    }
}
#Preview{
    NavigationStack{
        AssetDetailView(viewModel: .init(asset: .init(id: "bitcoin", name: "Bitcoin", symbol: "BTC", priceUsd:"121321.1212", changePercent24Hr: "2.36")))
    }
}
