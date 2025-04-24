//
//  AssetList.swift
//  Crypto-IOS
//
//  Created by user272164 on 4/11/25.
//

import SwiftUI

struct AssetList: View {
    
    @State var viewModel: AssetListViewModel = .init()
    
    var body: some View {
        NavigationStack{
            Text(viewModel.errorMessage ?? "")
            List {
                ForEach(viewModel.assets) { asset in
                    NavigationLink{
                        AssetDetailView(viewModel: .init(asset: asset))
                    }label:{
                        AssetView(assetViewState: .init(asset))
                    }
                }
            }
            .listStyle(.plain)
            .task {
                await viewModel.fetchAssets()
            }
            .navigationTitle("Home")
        }
        
    }
}

#Preview {
    AssetList()
}
