//
//  AnasayfaViewModel.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 1.08.2024.
//

import Foundation
import CoreData
import FirebaseFirestore

class AnasayfaViewModel : ObservableObject{
    @Published var kisilerListesi = [Kisiler]()
    
    let collectionKisiler = Firestore.firestore().collection("Kisiler")
    
    func kisileriYukle(){
        
        collectionKisiler.addSnapshotListener { (snapshot, error) in
           
            var liste = [Kisiler]()
            if let documents = snapshot?.documents{
                for document in documents{
                    let data = document.data()
                    let kisi_id = document.documentID
                    let kisi_ad = data["kisi_ad"] as? String ?? ""
                    let kisi_tel = data["kisi_tel"] as? String ?? ""
                    
                    let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                    liste.append(kisi)
                }
            }
            DispatchQueue.main.async {
                self.kisilerListesi = liste //tetikleme
            }
          
        }
    }
    
    func ara(aramaKelimesi:String){
        collectionKisiler.addSnapshotListener { (snapshot, error) in
           
            var liste = [Kisiler]()
            if let documents = snapshot?.documents{
                for document in documents{
                    let data = document.data()
                    let kisi_id = document.documentID
                    let kisi_ad = data["kisi_ad"] as? String ?? ""
                    let kisi_tel = data["kisi_tel"] as? String ?? ""
                    
                    if kisi_ad.lowercased().contains(aramaKelimesi.lowercased()){
                        let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                        liste.append(kisi)
                    }
                }
            }
            DispatchQueue.main.async {
                self.kisilerListesi = liste //tetikleme
            }
          
        }
    }
    
    func sil(kisi_id:String){
        collectionKisiler.document(kisi_id).delete()
    }
}
