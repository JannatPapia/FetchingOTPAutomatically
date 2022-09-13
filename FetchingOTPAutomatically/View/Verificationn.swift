//
//  Verificationn.swift
//  FetchingOTPAutomatically
//
//  Created by Jannatun Nahar Papia on 13/9/22.
//

import SwiftUI

struct Verificationn: View {
    @StateObject var otpModel: OTPViewModel = .init()
    //MARK: TextField FocusState
    @FocusState var activeField: OTPField?
    var body: some View {
        VStack{
            OTPField()
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("Verification")
        .onChange(of: otpModel.otpFields) {newValue in
                   OTPCondition(value: newValue)
               }
    }
    
    //MARK: Conditions For Custom OTP Field & Limiting only one text
        func OTPCondition(value: [String]){
            //Moving Next Field If Current Field Type
            for index in 0..<5{
                if value[index].count == 1 && activeStateForIndex(index: index) == activeField{
                    activeField = activeStateForIndex(index: index + 1)
                }
            }
            for index in 0..<6{
                if value[index].count > 1{
                    otpModel.otpFields[index] = String(value[index].last!)
                }
            }
        }
    
    //MARK: Custom OTP TextField
    @ViewBuilder
    func OTPField()->some View{
        HStack(spacing: 14){
            ForEach(0..<6,id: \.self){index in
                VStack(spacing: 8){
                    TextField("", text: $otpModel.otpFields[index])
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .multilineTextAlignment(.center)
                        .focused($activeField, equals: activeStateForIndex(index: index))
                    
                    Rectangle()
                        .fill(activeField == activeStateForIndex(index: index) ? Color.blue : Color.gray.opacity(0.3))
                        .frame(height: 4)
                }
                .frame(width: 40)
            }
        }
    }
        func activeStateForIndex(index: Int)-> OTPField {
            switch index{
            case 0: return .field1
            case 1: return .field2
            case 2: return .field3
            case 3: return .field4
            case 4: return .field5
            default: return .field6
            }
        }
}

struct Verificationn_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//MARK: FocusState Enum
enum OTPField{
    case field1
    case field2
    case field3
    case field4
    case field5
    case field6
}
