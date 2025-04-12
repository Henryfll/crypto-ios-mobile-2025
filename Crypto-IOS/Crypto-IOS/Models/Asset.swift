//
//  Asset.swift
//  Crypto-IOS
//
//  Created by user272164 on 4/11/25.
//
import Foundation

struct Asset :Decodable , Identifiable, Equatable {
    let id: String
    let name:String
    let symbol:String
    let priceUsd:String
    let changePercent24Hr:String
    
   
    
}


