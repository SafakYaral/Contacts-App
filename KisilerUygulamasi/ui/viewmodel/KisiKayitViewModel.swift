//
//  KisiKayitViewModel.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 1.08.2024.
//

import Foundation
import CoreData
import FirebaseFirestore

class KisiKayitViewModel {
    let collectionKisiler = Firestore.firestore().collection("Kisiler")
    
    func kaydet(kisi_ad:String,kisi_tel:String){
        let yeniKisi: [String: Any] = ["kisi_id":"", "kisi_ad":kisi_ad, "kisi_tel":kisi_tel]
        collectionKisiler.document().setData(yeniKisi)
    }
}
