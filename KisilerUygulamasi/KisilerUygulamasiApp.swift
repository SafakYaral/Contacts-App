//
//  KisilerUygulamasiApp.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 1.08.2024.
//

import SwiftUI
import CoreData
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct KisilerUygulamasiApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            Anasayfa()
        }
    }
}

