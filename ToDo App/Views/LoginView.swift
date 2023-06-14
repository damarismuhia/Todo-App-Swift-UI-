//
//  LoginView.swift
//  ToDo App
//
//  Created by Damaris Muhia on 08/06/2023.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        //A view that displays a root view and enables you to present/navigate additional views over the root view.
        NavigationView {
            VStack{
                //Header
                HeaderView()
                
                //Login form
                VStack{
                    TextField("Email Address",text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                    SecureField("Password",text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                    Button  {
                        //action
                    }
                label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .frame(height: 55)
                                .foregroundColor(.blue)
                            Text("Login")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }.padding(.top,20)
                }.padding([.leading,.trailing],16)
                Spacer()
                //Create an account
                VStack(spacing: 8){
                    Text("Don't have an account?")
                      //  .padding(.bottom,8)
                    
                    NavigationLink("Create an Account",destination: RegistrationView())
                        
                        
                }
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
