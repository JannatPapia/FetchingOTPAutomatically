//
//  OTPViewModel.swift
//  FetchingOTPAutomatically
//
//  Created by Jannatun Nahar Papia on 12/9/22.
//

import SwiftUI
import Firebase

class OTPViewModel: ObservableObject {
    //MARK: Login Data
    @Published var number : String = ""
    @Published var code : String = ""
    
    @Published var otpText: String = ""
    @Published var otpFields: [String] = Array(repeating: "", count: 6)
    
    
    //MARK: Error
    @Published var showAlert: Bool = false
    @Published var errorMsg: String = ""
    
    //MARK: Sending OTP
    func sendOTP()async{
        do{
            let result = try await
            PhoneAuthProvider.provider().verifyPhoneNumber("+880\(code)\(number)", uiDelegate: nil)
        }
        catch{
            handleError(error: error.localizedDescription)
        }
    }
    
    func handleError(error: String) {
        DispatchQueue.main.async {
            self.errorMsg = error
            self.showAlert.toggle()
        }
    }
}


