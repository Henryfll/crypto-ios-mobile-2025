//
//  AssetsApiClient.swift
//  Crypto-IOS
//
//  Created by user272164 on 4/12/25.
//
import Dependencies
import Foundation

struct AssetsApiClient{
    var fetchAllAssets:() async throws -> [Asset]
}
enum NetworkingError:Error{
    case invalidURL
    
    var localizedDescription:  String{
        switch self{
        case .invalidURL:
            return "Invalid URL"
        }
    }
}

extension AssetsApiClient: DependencyKey{
    static var liveValue:AssetsApiClient{
        .init (
            fetchAllAssets:{
                let urlSession = URLSession.shared
                
                guard let url = URL(string:"https://c8dc6bef-802f-4ebc-b955-7b693182aa53.mock.pstmn.io/v3/assets") else{
                    throw NetworkingError.invalidURL
                }
                
                    let (data, _) = try await urlSession.data(for: URLRequest(url:url))
                    let assetsResponse = try JSONDecoder().decode(AssetsResponse.self, from: data)
                    return assetsResponse.data
               
            }
        )
    }
    
    static var previewValue: AssetsApiClient{
        .init(fetchAllAssets: {[
            .init(
                id: "bitcoin",
                name: "Bitcoin",
                symbol: "BTC",
                priceUsd: "12315",
                changePercent24Hr: "8.87"
            ),
            .init(
                id: "etherium",
                name: "Etherium",
                symbol: "ETH",
                priceUsd: "8454",
                changePercent24Hr: "-4.87"
            )
            ,
            .init(
                id: "solanda",
                name: "Solanda",
                symbol: "SOL",
                priceUsd: "12.545465",
                changePercent24Hr: "8.87"
            )
        ]})
    }
    
    static var testValue: AssetsApiClient{
        .init(fetchAllAssets: {
            reportIssue("AssetsApiClient.fetchAllAssets is unimplement")
            return []
        })
    }
}

extension DependencyValues{
    var assetsApiClient: AssetsApiClient{
        get { self [AssetsApiClient.self]}
        set { self [AssetsApiClient.self] = newValue}
    }
}
