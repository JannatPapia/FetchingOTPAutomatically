//
//  FetchingOTPAutomaticallyApp.swift
//  FetchingOTPAutomatically
//
//  Created by Jannatun Nahar Papia on 12/9/22.
//

import SwiftUI
import Firebase

@main
struct FetchingOTPAutomaticallyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

//MARK: Setting up Firebase

class AppDelegate: NSObject,UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil)-> Bool{
        FirebaseApp.configure()
        return true
    }
    
    // Since OTP requires remote Notification
    func application(_ application: UIApplication, didRecieveRemoteNotification userInfo: [AnyHashable : Any]) async ->
    UIBackgroundFetchResult {
        return .noData
    }
}
