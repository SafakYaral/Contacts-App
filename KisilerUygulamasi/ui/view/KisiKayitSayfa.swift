//
//  KisiKayitSayfa.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 1.08.2024.
//

import SwiftUI

struct KisiKayitSayfa: View {
    @State private var tfKisiAd = ""
    @State private var tfKisiTel = ""
    
    var viewModel = KisiKayitViewModel()
    
    
    var body: some View {
        VStack(spacing: 100){
            TextField("Kişi Ad",text: $tfKisiAd).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
            TextField("Kişi Tel",text: $tfKisiTel).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
            Button("KAYDET"){
                viewModel.kaydet(kisi_ad: tfKisiAd, kisi_tel: tfKisiTel)
            }
            
        }.navigationTitle("Kişi Kayıt")
    }
}

#Preview {
    KisiKayitSayfa()
}
