//
//  LoginViewViewModel.swift
//  ToDo App
//
//  Created by Damaris Muhia on 14/06/2023.
// LoginViewViewModel meant to handle the business logic

import Foundation
/**
 ObservableObject -  is a protocol in SwiftUI that allows you to create objects whose changes can be observed by views. 
 @Published attribute ensures that any changes to these properties will automatically trigger updates to the associated views.
 */
class LoginViewViewModel:ObservableObject{
    @Published var email = ""
    @Published var password = ""
    
    init() {
        
    }
    
}
