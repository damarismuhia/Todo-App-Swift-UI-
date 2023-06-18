//
//  Extensions.swift
//  ToDo App
//
//  Created by Damaris Muhia on 18/06/2023.
//

import Foundation

//binary to textual
extension Encodable{
    func asDictionary() -> [String:Any] {
        /**
         - JSONEncoder -> converts swift objects(class and struct) or Values(disctionary, array etc) into JSON data format
         - .encode -> when you call this method you pass in the swift object/value that you want to encode as a param. this will return a "DATA" object(bytes) containing a
         JSON representation of the encoded data.
         **********************************************************************
         JSONSerialization - converts JSON data to and from Swift objects ie(JSON to  Swift objects and Swift objects  to JSON data).
         - JSON to  Swift objects -> we use JSONSerialization.jsonObject(with: data,options: <#T##JSONSerialization.ReadingOptions#>) --- method to deserialize the JSON data into swift values such as Array, Dict and returns an optional "Any" object representing deserialized JSON.
         - You need to cast the returned object ANY, to whatever swift value you want
         - Swift objects  to JSON data -> use JSONSerialization.data(withJSONObject: <#T##Any#>,options: <#T##JSONSerialization.WritingOptions#>) -- to serialize the swift object into jsondata
         the serialized JSON data can be obtained as data wich can be converted into a string.
         ************
         use JSONSerialization when you want the output  to be of specific   swift object/value eg dict etc
         //NB: JSONSerialization is a two way ie can converts JSON data to and from Swift objects using jsonObject and data respectively
         use JSONEncoder to convert swift object to JSON DATA
         use JSONDEcoder to convert JSON DATAs to swift object
         */
        guard let data = try? JSONEncoder().encode(self) else{
            return[:]
        }
        do{
            let json = try JSONSerialization.jsonObject(with: data,options: []) as? [String: Any]
            return json ?? [:]
        }catch{
            return [:]
        }
    }
    
}
