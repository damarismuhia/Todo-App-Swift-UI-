//
//  User.swift
//  ToDo App
//
//  Created by Damaris Muhia on 18/06/2023.
//

import Foundation
//Mark this as codable as we want to convert it into a dictionary with string and value that we can import into the database.
struct User:Codable {
    let userId:String
    let name:String
    let email:String
    let dateJoint:TimeInterval
}
