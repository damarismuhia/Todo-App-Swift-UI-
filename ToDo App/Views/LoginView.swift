//
//  LoginView.swift
//  ToDo App
//
//  Created by Damaris Muhia on 08/06/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        //A view that displays a root view and enables you to present/navigate additional views over the root view.
        NavigationView {
            VStack{
                //Header
                HeaderView(title: "ToDo List", subTitle: "Login", angle: 15, background: .blue, offSetValue: -100,height: 300,paddingTop: 30)

                //Login form
                VStack{
                    if(!viewModel.errorMessage.isEmpty){
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                   }
                    
                    TextField("Email Address",text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    //disable auto cap for first letter
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        
                    SecureField("Password",text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        
                    CustomButton(btnTitle: "Login", btnBgColor: .blue){
                        viewModel.loginUser(){ success, authData in
                            if(success){
                                
                            }
                        }
                        
                    }
                   // btn
                   .padding(.top,20)
                }
                .padding([.leading,.trailing],16)
                .offset(y: -50)
                   
                Spacer()
                //Create an account
                VStack(spacing: 8){
                    Text("Don't have an account?")
                      //  .padding(.bottom,8)
                    
                    NavigationLink("Create an Account",destination: RegisterView())
                        
                        
                }
                .padding(.bottom,50)
                Spacer()
            }

        }
       
    }
    
  
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
