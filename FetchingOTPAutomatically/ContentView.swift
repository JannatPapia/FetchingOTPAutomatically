//
//  ContentView.swift
//  FetchingOTPAutomatically
//
//  Created by Jannatun Nahar Papia on 12/9/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_status") var log_status = false
    var body: some View {
        NavigationView{
            if log_status{
                Text("Home")
                    .navigationTitle("Home")
            }
            else {
                Login()
            }
     //   Verificationn()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
