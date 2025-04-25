//
//  FavouritiesViewModel.swift
//  Crypto-IOS
//
//  Created by user272164 on 4/24/25.
//

import Foundation
import Dependencies

@Observable
final class FavouritiesViewModel{
    
    @ObservationIgnored
    @Dependency(\.assetsApiClient) var apiClient
    
    @ObservationIgnored
    @Dependency(\.authClient) var authClient
    
    var favourites : [String] = []
    var assets : [Asset] = []
    
    func getFavourites() async {
             do {
                 let user = try authClient.getCurrentUser()
                 favourites = try await apiClient.fetchFavourities(user)
                 for favourite in favourites {
                     print("Started fetching asset \(favourite)")
                     let asset = try await apiClient.fetchAsset(favourite)
                     assets += [asset]
                     print("Completed fetching asset \(favourite)")
                 }
             } catch {
                 print(error.localizedDescription)
                 // Handle errors
             }
         }
}
