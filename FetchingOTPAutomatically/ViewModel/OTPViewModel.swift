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
    
    //MARK: OTP Credentials
    @Published var verificationCode : String = ""
    
    @Published var isLoading: Bool = false
    
    @Published var navigationTag: String?
    
    //MARK: Sending OTP
    func sendOTP()async{
        if isLoading{return}
        do{
            isLoading = true
            let result = try await
            PhoneAuthProvider.provider().verifyPhoneNumber("+\(code)\(number)", uiDelegate: nil)
            DispatchQueue.main.async {
                self.isLoading = false
                self.verificationCode = result
                self.navigationTag = "VERIFICATION"
            }
        }
        catch{
            handleError(error: error.localizedDescription)
        }
    }
    
    func handleError(error: String) {
        DispatchQueue.main.async {
            self.isLoading = false
            self.errorMsg = error
            self.showAlert.toggle()
        }
    }
}


