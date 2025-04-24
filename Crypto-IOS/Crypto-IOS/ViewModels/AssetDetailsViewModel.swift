//
//  AssetDetailsViewModel.swift
//  Crypto-IOS
//
//  Created by user272164 on 4/23/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@Observable
final class AssetDetailsViewModel{
    
    let asset: Asset
    var errorMessage: String?
    var showError = false
    
    init (asset:Asset){
        self.asset = asset
    }
    
    func addToFavourities(){
        //1 chech user
        guard let user = Auth.auth().currentUser else {
            errorMessage = "User not authenticated"
            showError = true
            return
        }
        
        let userId = user.uid
        
        //2 base
        let db = Firestore.firestore()
        db.collection("favourities")
            .document(userId)
            .setData(
                ["favourities": FieldValue.arrayUnion([asset.id])],
                merge:true
            )
       
    }
}
