//
//  OTPViewModel.swift
//  FetchingOTPAutomatically
//
//  Created by Jannatun Nahar Papia on 12/9/22.
//

import SwiftUI
import Firebase

class OTPViewModel: ObservableObject {
    @Published var otpText: String = ""
    @Published var otpFields: [String] = Array(repeating: "", count: 6)
}


