//
//  ContentView.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 1.08.2024.
//

import SwiftUI

struct Anasayfa: View {
    @State private var aramaKelimesi = ""
    
    @ObservedObject private var viewModel = AnasayfaViewModel()
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(viewModel.kisilerListesi){ kisi in
                    NavigationLink(destination: KisiDetaySayfa(kisi: kisi)){
                        KisilerSatir(kisi: kisi)
                    }
                }.onDelete(perform: sil)
            }.navigationTitle("Kişiler")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink(destination: KisiKayitSayfa()){
                            Image(systemName: "plus")
                        }
                    }
                }.onAppear{
                    viewModel.kisileriYukle()
                }
        }.searchable(text: $aramaKelimesi,prompt: "Ara")
            .onChange(of: aramaKelimesi){ _ , s in
                
                if s == "" {
                    viewModel.kisileriYukle()
                }else{
                    viewModel.ara(aramaKelimesi: s)
                }
            }
    }
    
    func sil(at offsets:IndexSet){
        let kisi = viewModel.kisilerListesi[offsets.first!]
        viewModel.sil(kisi_id: kisi.kisi_id!)
    }
}

#Preview {
    Anasayfa()
}
