//
//  KisiDetayViewModel.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 1.08.2024.
//

import Foundation
import CoreData
import FirebaseFirestore

class KisiDetayViewModel {
    let collectionKisiler = Firestore.firestore().collection("Kisiler")
   
    func guncelle(kisi_id:String,kisi_ad:String,kisi_tel:String){
        let guncellenenKisi: [String: Any] = ["kisi_ad":kisi_ad, "kisi_tel":kisi_tel]
        collectionKisiler.document(kisi_id).updateData(guncellenenKisi)
    }
}
