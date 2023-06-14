//
//  RegisterView.swift
//  ToDo App
//
//  Created by Damaris Muhia on 14/06/2023.
//

import SwiftUI

struct RegisterView: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    var body: some View {
        
        NavigationView {
            VStack{
                //Header
                HeaderView(title: "Register", subTitle: "Start organizing todos", angle: -15, background: .orange, offSetValue: -150,height: 400,paddingTop: 80)
                //Register form
                VStack{
                    TextField("Full name",text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    //disable auto cap for first letter
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    TextField("Email Address",text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Create Password",text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    Spacer()
                        
                    CustomButton(btnTitle: "Create Account", btnBgColor: .orange){
                        //closure body
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
