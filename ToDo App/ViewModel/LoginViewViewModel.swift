//
//  LoginViewViewModel.swift
//  ToDo App
//
//  Created by Damaris Muhia on 14/06/2023.
// LoginViewViewModel meant to handle the business logic

import FirebaseAuth
/**
 ObservableObject -  is a protocol in SwiftUI that allows you to create objects whose changes can be observed by views. 
 @Published attribute ensures that any changes to these properties will automatically trigger updates to the associated views.
 */
class LoginViewViewModel:ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
   // var completionHandler: (Bool)->Void
    func loginUser(completion: @escaping(Bool,AuthDataResult?) -> Void) {
        guard validateLoginDetails() else {return}
        //sigin user using firebase
        Auth.auth().signIn(withEmail: email, password: password){[weak self] result,error in
            guard let result = result else {
                completion(false,nil)
                self?.errorMessage = error?.localizedDescription ?? "Check your details and try again!"
                return
            }
            completion(true,result)
            
        }
        
    }
    
    func validateLoginDetails()->Bool{
        if(email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            errorMessage = "Email address is required"
            return false
        }else if(!email.trimmingCharacters(in: .whitespacesAndNewlines).contains("@") && !email.trimmingCharacters(in: .whitespacesAndNewlines).contains(".")){
            errorMessage = "Please enter a valid Email address"
            return false
        }else if (password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            errorMessage = "Password is required"
            return false
        }else{
            errorMessage = ""
            return true
        }
    }
    
}
