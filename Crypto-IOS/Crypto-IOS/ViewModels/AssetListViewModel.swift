//
//  AssetListViewModel.swift
//  Crypto-IOS
//
//  Created by user272164 on 4/11/25.
//
import Foundation
import Dependencies

@Observable
final class AssetListViewModel{
    var errorMessage: String?
    var assets: [Asset] = []
    
    @ObservationIgnored
    @Dependency(\.assetsApiClient) var apiClient
    
    var clientConfigured = false
    func configClient(){
        clientConfigured = true
    }
    
    func fetchAssets()async{
        do{
            assets = try await apiClient.fetchAllAssets()
        }catch let error as NetworkingError{
            errorMessage = error.localizedDescription
        } catch{
            errorMessage = error.localizedDescription
        }
    }
    
   // func fetchAssets() async {
    //    let urlSession = URLSession.shared
        
      ///  guard let url = URL(string:"https://c8dc6bef-802f-4ebc-b955-7b693182aa53.mock.pstmn.io/v3/assets") else{
       //     errorMessage = "Invalid URL"
       //     return
       // }
        
        //let urlRequest = URLRequest(url:url)
        
      //  do{
      //      let (data, _) = try await urlSession.data(for: URLRequest(url:url))
      //      let assetsResponse = try JSONDecoder().decode(AssetsResponse.self, from: data)
      //      self.assets = assetsResponse.data
      //  } catch{
      //      print(error.localizedDescription)
      //      errorMessage = error.localizedDescription
      //  }
    //}
}
