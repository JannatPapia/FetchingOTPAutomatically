//
//  Verification.swift
//  FetchingOTPAutomatically
//
//  Created by Jannatun Nahar Papia on 12/9/22.
//

import SwiftUI

struct Verification: View {
    var body: some View {
        VStack{
            OTPField()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .top)
        .navigationTitle("Verification")
    }
    
    // MARK: Custom OTP TextField
    @ViewBuilder
    func OTPField()-> some View {
        HStack(spacing: 14){
            ForEach(0..<6, id: \.self){index in
                VStack(spacing: 8) {
                    
                }
            }
        }
    }
}

struct Verification_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
