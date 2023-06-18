//
//  RegisterView.swift
//  ToDo App
//
//  Created by Damaris Muhia on 14/06/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = ReisterViewModel()
    var body: some View {
        
        NavigationView {
            VStack{
                //Header
                HeaderView(title: "Register", subTitle: "Start organizing todos", angle: -15, background: .orange, offSetValue: -150,height: 400,paddingTop: 80)
                //Register form
                VStack{
                    if(!viewModel.errorMessage.isEmpty){
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Full name",text: $viewModel.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    //disable auto cap for first letter
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    TextField("Email Address",text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Create Password",text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    Spacer()
                        
                    CustomButton(btnTitle: "Create Account", btnBgColor: .orange){
                        viewModel.registerUser()
                    }
                        .padding(.top,20)
                }.padding([.leading,.trailing],16) //this create a padding left and right for this vertical stack view.
                   .offset(y:-30) //create a space at the bottom
                Spacer()
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
