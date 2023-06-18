//
//  ReisterViewModel.swift
//  ToDo App
//
//  Created by Damaris Muhia on 18/06/2023.
//

import FirebaseAuth
import FirebaseFirestore

class ReisterViewModel:ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
    }
    
     func registerUser(){
        guard validateRegisterDetails() else {return}
        Auth.auth().createUser(withEmail: email, password: password){ [weak self]result, error in
            //get the user id after user creation
            guard let result = result else{
                self?.errorMessage = error?.localizedDescription ?? "Ooops unable to create the user. Please try again later..."
                return
            }
            
            let userId = result.user.uid
            self?.insertUserRecord(userId: userId)
            
        }
    }
    private func insertUserRecord(userId:String){
        //.timeIntervalSince1970 used since we cant save date object directly into firebase database, we use number of sec frm the date since 1970, or another option is to use a string
        let newUser = User(userId: userId, name: name, email: email, dateJoint: Date().timeIntervalSince1970)
        //insert into the firebase db
        let db = Firestore.firestore()
        //records are stored in collection and document
        db.collection("users")
            .document(userId)
        //this takes a dictionary
            .setData(newUser.asDictionary())
        
    }
    
  private  func validateRegisterDetails()->Bool{
        if(name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            errorMessage = "Please enter your name"
            return false
        }else if(email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
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
