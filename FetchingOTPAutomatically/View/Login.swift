//
//  Login.swift
//  FetchingOTPAutomatically
//
//  Created by Jannatun Nahar Papia on 13/9/22.
//

import SwiftUI

struct Login: View {
    @StateObject var otpModel: OTPViewModel = .init()
    var body: some View {
        VStack{
            HStack(spacing: 10){
                VStack(spacing: 8){
                    TextField("1", text: $otpModel.code)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                    
                    Rectangle()
                        .fill(otpModel.code == "" ? Color.gray.opacity(0.35) : Color.blue)
                        .frame(height: 2)
                }
                .frame(width: 40)
                
                VStack(spacing: 8){
                    TextField("1283748", text: $otpModel.number)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                    
                    Rectangle()
                        .fill(otpModel.number == "" ? Color.gray.opacity(0.35) : Color.blue)
                        .frame(height: 2)
                }
            }
            
            Button {
                Task{await otpModel.sendOTP()}
            } label: {
                Text("Login")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .background{
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.blue)
                            .opacity(otpModel.isLoading ? 0 : 1)
                    }
                    .overlay{
                    ProgressView()
                            .opacity(otpModel.isLoading ? 1 : 0)
                }
            }
            .disabled(otpModel.code == "" || otpModel.number == "")
            .opacity(otpModel.code == "" || otpModel.number == "" ? 0.4 : 1)
        }
        .navigationTitle("Login")
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
