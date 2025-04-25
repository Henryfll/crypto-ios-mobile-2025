//
//  FavouritiesView.swift
//  Crypto-IOS
//
//  Created by user272164 on 4/24/25.
//
import SwiftUI

struct FavouritiesView: View {
    
    
    @State var viewModel : FavouritiesViewModel = .init()
    
    var body: some View {
        List{
            ForEach(viewModel.assets){ asset in
                AssetView(
                    assetViewState: .init(asset)
                )
            }
        }.listStyle(.plain)
            .task {
                await viewModel.getFavourites()
            }
    }
}

#Preview {
    FavouritiesView()
}
