//
//  MainViewModel.swift
//  ToDo App
//
//  Created by Damaris Muhia on 18/06/2023.
//

import FirebaseAuth
class MainViewModel:ObservableObject{
    @Published var currentUserId:String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        //callback listener to check to see if my user just logged in OR not / Get the currently signed-in user
        self.handler = Auth.auth().addStateDidChangeListener{[weak self] auth, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    
    public var isUserSignedIn:Bool{
        return Auth.auth().currentUser != nil
    }
}
